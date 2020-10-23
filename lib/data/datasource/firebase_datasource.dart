import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_levelup_story/data/datasource/remote_datasource.dart';
import 'package:my_levelup_story/data/models/user.dart' as luser;
import 'package:my_levelup_story/util/constants.dart';
import 'package:my_levelup_story/util/local_storage_manager.dart';

const USERS_PATH = "users";
const ITEMS_PATH = "items";
const NOTIFICATIONS_PATH = "notifications";

class FirebaseDatasource implements RemoteDatasource {
  // 外部からauthやFirestore触らせないようにする(Firebase依存をなくすため)
  FirebaseFirestore _db;
  FirebaseAuth _auth;

  @override
  initializeApp() async {
    await Firebase.initializeApp();
    _auth = FirebaseAuth.instance;
    _db = FirebaseFirestore.instance;
  }

  @override
  Future<Map<String, dynamic>> signInAnonymously() async {
    final ret = await _auth.signInAnonymously();
    final firebaseUser = ret?.user;
    if (firebaseUser == null) return null;
    Map<String, dynamic> map = Map();
    map[ID_KEY] = firebaseUser.uid;
    return map;
  }

  @override
  Future<Map<String, dynamic>> getUser(String userId) async {
    DocumentReference doc = _db.collection(USERS_PATH).doc(userId);
    return (await doc.get()).data();
  }

  @override
  Future<Map<String, dynamic>> addUser(Map<String, dynamic> params) async {
    DocumentReference doc = _db.collection(USERS_PATH).doc(params[ID_KEY]);
    DocumentSnapshot snapshot = await doc.get();
    if (!snapshot.exists) {
      _setCreatedAtParam(params);
      _setUpdatedAtParam(params);
      await doc.set(params, SetOptions(merge: true));
      snapshot = await doc.get();
    }
    return convertTimestamp(snapshot.data());
  }

  @override
  Future<Map<String, dynamic>> updateUser(Map<String, dynamic> params) async {
    DocumentReference doc = _db.collection(USERS_PATH).doc(params[ID_KEY]);
    _setUpdatedAtParam(params);
    await doc.set(params, SetOptions(merge: true));
    final snapshot = await doc.get();
    return convertTimestamp(snapshot.data());
  }


  @override
  Future<Map<String, dynamic>> addItem(Map<String, dynamic> params) async {
    params = await _setItemBasicParams(params);
    return convertTimestamp(
        await _setDocument(ITEMS_PATH, params[ID_KEY], params));
  }

  @override
  Future<Map<String, dynamic>> editItem(Map<String, dynamic> params) async {
    return convertTimestamp(
        await _setDocument(ITEMS_PATH, params[ID_KEY], params));
  }

  @override
  Future<void> updateItem(Map<String, dynamic> params) async {
    await _setDocument(ITEMS_PATH, params[ID_KEY], params);
  }

  @override
  Future<void> deleteItem(String id) async {
    await _deleteDocument(ITEMS_PATH, id);
  }

  @override
  Future<Map<String, dynamic>> getItem(String itemId) async {
    return _getJson((await _getItemDoc(itemId)).data());
  }

  @override
  Future<List<Map<String, dynamic>>> getItems(String userId,
      DateTime lastDate) async {
    return await _getJsons(_getItemsQuery(userId, lastDate));
  }

  @override
  Future<List<Map<String, dynamic>>> getOurItems(DateTime lastDate) async {
    return await _getJsons(_getOurItemsQuery(lastDate));
  }

  @override
  Future<List<Map<String, dynamic>>> getProfileItems(String userId, DateTime lastDate) async {
    return await _getJsons(_getProfileItemsQuery(userId, lastDate));
  }

  @override
  Future<List<Map<String, dynamic>>> getNotifications(String userId, DateTime lastDate) async {
    return await _getJsons(_getNotificationsQuery(userId, lastDate));
  }

  @override
  Future<Map<String, dynamic>> addNotification(Map<String, dynamic> params) async {
    params = await _setNotificationBasicParams(params);
    return convertTimestamp(
        await _setDocument(NOTIFICATIONS_PATH, params[ID_KEY], params));
  }

  // --- private method ---
  DocumentReference _getUserRef(uuid) => _db.collection(USERS_PATH).doc(uuid);
  DocumentReference _getItemRef(uuid) => _db.collection(ITEMS_PATH).doc(uuid);
  Future<DocumentSnapshot> _getUserDoc(uuid) => _getUserRef(uuid).get();
  Future<DocumentSnapshot> _getItemDoc(itemId) => _getItemRef(itemId).get();

  Future<List<Map<String, dynamic>>> _getJsons(Query q) async =>
      (await q.get()).docs.map((doc) => _getJson(doc.data()))
      .toList();

  Map<String, dynamic> _getJson(Map<String, dynamic> json) =>
      convertTimestamp(json);

  Map<String, dynamic> convertTimestamp(Map<String, dynamic> json) {
    if (json["createdAt"] is Timestamp) {
      json["createdAt"] = json["createdAt"].toDate().toString();
    }
    if (json["updatedAt"] is Timestamp) {
      json["updatedAt"] = json["updatedAt"].toDate().toString();
    }
    return json;
  }

  Future<Map<String, dynamic>> _setNotificationBasicParams(Map<String, dynamic> params) async {
    final uuid = params["toUserId"];
    final fromUserId = params["fromUserId"];
    await _setUserRefParam(params, uuid);
    await _setSubUserParam(params, fromUserId, "fromUser");
    return _setBasicParams(params);
  }

  Future<Map<String, dynamic>> _setItemBasicParams(Map<String, dynamic> params) async {
    String uuid = await LocalStorageManager.getMyUserId();
    await _setUserRefParam(params, uuid);
    await _setSubUserParam(params, uuid);
    return _setBasicParams(params);
  }

  Future<Map<String, dynamic>> _setBasicParams(Map<String, dynamic> params) async {
    _setIdParam(params);
    _setCreatedAtParam(params);
    _setUpdatedAtParam(params);
    return params;
  }

  String _getNewFirestoreId() => _db.collection('_').doc().id;

  Future<Map<String, dynamic>> _setSubUserParam(Map<String, dynamic> params, String uuid, [String paramName = "user"]) async {
    DocumentSnapshot userDoc = await _getUserDoc(uuid);
    final user = luser.User.fromJson(userDoc.data());
    params[paramName] = luser.User.getSubUserParams(user);
    return params;
  }

  Future<Map<String, dynamic>> _setDocument(String collectionPath, String documentId, Map<String, dynamic> params) async {
    DocumentReference doc = _db.collection(collectionPath).doc(documentId);
    await doc.set(params, SetOptions(merge: true));
    return (await doc.get()).data();
  }

  Future<void> _deleteDocument(String collectionPath, String documentId) async {
    await _db.collection(collectionPath).doc(documentId).delete();
  }

  Query _getItemsQuery(String userId, DateTime lastDate) {
    DocumentReference userRef = _getUserRef(userId);
    Query query = _db.collection(ITEMS_PATH)
        .where("userRef", isEqualTo: userRef)
        .orderBy("createdAt", descending: true);
    return _getPagingQuery(query, lastDate);
  }

  Query _getNotificationsQuery(String userId, DateTime lastDate) {
    DocumentReference userRef = _getUserRef(userId);
    Query query = _db.collection(NOTIFICATIONS_PATH)
        .where("userRef", isEqualTo: userRef)
        .orderBy("createdAt", descending: true);
    return _getPagingQuery(query, lastDate);
  }

  Query _getPagingQuery(Query q, DateTime lastDate) {
    q = lastDate != null ? q.startAfter([Timestamp.fromDate(lastDate)]) : q;
    return q.limit(LIST_LIMIT);
  }

  Query _getOurItemsQuery(DateTime lastDate) {
    Query query = _db.collection(ITEMS_PATH)
        .where("isPublic", isEqualTo: true)
        .orderBy("createdAt", descending: true);
    return _getPagingQuery(query, lastDate);
  }

  Query _getProfileItemsQuery(String userId, DateTime lastDate) {
    DocumentReference userRef = _getUserRef(userId);
    Query query = _db.collection(ITEMS_PATH)
        .where("userRef", isEqualTo: userRef)
        .where("isPublic", isEqualTo: true)
        .orderBy("createdAt", descending: true);
    return _getPagingQuery(query, lastDate);
  }

  Map<String, dynamic> _setIdParam(Map<String, dynamic> params) {
    params[ID_KEY] = _getNewFirestoreId();
    return params;
  }

  Future<Map<String, dynamic>> _setUserRefParam(Map<String, dynamic> params, String uuid, [String paramName = "userRef"]) async {
    params[paramName] = _getUserRef(uuid);
    return params;
  }

  FieldValue _serverTimestamp() => FieldValue.serverTimestamp();
  Map<String, dynamic> _setCreatedAtParam(Map<String, dynamic> params) {
    params["createdAt"] = _serverTimestamp();
    return params;
  }
  Map<String, dynamic> _setUpdatedAtParam(Map<String, dynamic> params) {
    params["updatedAt"] = _serverTimestamp();
    return params;
  }
}
