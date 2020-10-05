import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_levelup_story/data/datasource/remote_datasource.dart';
import 'package:my_levelup_story/data/models/user.dart' as luser;
import 'package:my_levelup_story/util/constants.dart';
import 'package:my_levelup_story/util/local_storage_manager.dart';

class FirebaseDatasource implements RemoteDatasource {
  // 外部からauthやFirestore触らせないようにする(Firebase依存をなくすため)
  FirebaseFirestore _db;
  FirebaseAuth _auth;

  //@override
  //final ID_KEY = "id";

  final USERS_PATH = "users";
  final ITEMS_PATH = "items";

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
    params = await _setFirebaseBasicParams(params);
    return convertTimestamp(
        await _setDocument(ITEMS_PATH, params[ID_KEY], params));
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

  // --- private method ---
  DocumentReference _getUserRef(uuid) => _db.collection(USERS_PATH).doc(uuid);
  DocumentReference _getItemRef(uuid) => _db.collection(ITEMS_PATH).doc(uuid);
  Future<DocumentSnapshot> _getUserDoc(uuid) => _getUserRef(uuid).get();
  Future<DocumentSnapshot> _getItemDoc(itemId) => _getItemRef(itemId).get();

  Future<List<Map<String, dynamic>>> _getJsons(Query q) async =>
      (await q.get()).docs.map((doc) => convertTimestamp(doc.data()))
      .toList();

  Map<String, dynamic> convertTimestamp(Map<String, dynamic> json) {
    if (json["createdAt"] is Timestamp) {
      json["createdAt"] = json["createdAt"].toDate().toString();
    }
    if (json["updatedAt"] is Timestamp) {
      json["updatedAt"] = json["updatedAt"].toDate().toString();
    }
    return json;
  }

  Future<Map<String, dynamic>> _setFirebaseBasicParams(Map<String, dynamic> params) async {
    String uuid = await LocalStorageManager.getMyUserId();
    await _setUserRefParam(params, uuid);
    await _setSubUserParam(params, uuid);
    _setIdParam(params);
    _setCreatedAtParam(params);
    _setUpdatedAtParam(params);
    return params;
  }

  String _getNewFirestoreId() {
    return _db.collection('_').doc().id;
  }

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

  Query _getItemsQuery(String userId, DateTime lastDate) {
    DocumentReference userRef = _getUserRef(userId);
    Query query = _db.collection(ITEMS_PATH)
        .where("userRef", isEqualTo: userRef)
        .orderBy("createdAt", descending: true);
    return _getPagingQuery(query, lastDate);
  }

  Query _getPagingQuery(Query q, DateTime lastDate) {
    if (lastDate != null) {
      final last = Timestamp.fromDate(lastDate);
      q = q.startAfter([last]);
    }
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
