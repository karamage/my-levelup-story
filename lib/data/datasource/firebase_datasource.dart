import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_levelup_story/data/models/user.dart' as luser;
import 'package:my_levelup_story/util/local_storage_manager.dart';

class FirebaseDatasource {
  // 外部からauthやFirestore触らせないようにする(Firebase依存をなくすため)
  FirebaseFirestore _db;
  FirebaseAuth _auth;
  //get db => _db;
  //get auth => _auth;

  final String ID_KEY = "id";
  final String USERS_PATH = "users";
  final String ITEMS_PATH = "items";

  initializeApp() async {
    //await new Future.delayed(new Duration(seconds: 1));
    await Firebase.initializeApp();
    _auth = FirebaseAuth.instance;
    _db = FirebaseFirestore.instance;
  }

  DocumentReference getUserRef(uuid) => _db.collection(USERS_PATH).doc(uuid);
  DocumentReference getItemRef(uuid) => _db.collection(ITEMS_PATH).doc(uuid);
  Future<DocumentSnapshot> getUserDoc(uuid) => getUserRef(uuid).get();
  Future<DocumentSnapshot> getItemDoc(itemId) => getItemRef(itemId).get();

  Future<Map<String, dynamic>> setFirebaseBasicParams(Map<String, dynamic> params) async {
    String uuid = await LocalStorageManager.getMyUserId();
    params = await setUserRefParam(params, uuid);
    params = await setSubUserParam(params, uuid);
    params = setIdParam(params);
    params = setCreatedAtParam(params);
    params = setUpdatedAtParam(params);
    return params;
  }
  Future<Map<String, dynamic>> signInAnonymously() async {
    final ret = await _auth.signInAnonymously();
    final firebaseUser = ret?.user;
    if (firebaseUser == null) return null;
    Map<String, dynamic> map = Map();
    map[ID_KEY] = firebaseUser.uid;
    return map;
  }

  String getNewFirestoreId() {
    return _db.collection('_').doc().id;
  }

  Future<Map<String, dynamic>> setSubUserParam(Map<String, dynamic> params, String uuid, [String paramName = "user"]) async {
    DocumentSnapshot userDoc = await getUserDoc(uuid);
    final user = luser.User.fromJson(userDoc.data());
    params[paramName] = luser.User.getSubUserParams(user);
    return params;
  }

  Future<Map<String, dynamic>> addUser(Map<String, dynamic> params) async {
    DocumentReference doc = _db.collection(USERS_PATH).doc(params[ID_KEY]);
    DocumentSnapshot snapshot = await doc.get();
    if (!snapshot.exists) {
      setCreatedAtParam(params);
      setUpdatedAtParam(params);
      await doc.set(params, SetOptions(merge: true));
      snapshot = await doc.get();
    }
    return snapshot.data();
  }

  Future<Map<String, dynamic>> addItem(Map<String, dynamic> params) async {
    params = await setFirebaseBasicParams(params);
    return await setDocument(ITEMS_PATH, params[ID_KEY], params);
  }

  Future<Map<String, dynamic>> setDocument(String collectionPath, String documentId, Map<String, dynamic> params) async {
    DocumentReference doc = _db.collection(collectionPath).doc(documentId);
    await doc.set(params, SetOptions(merge: true));
    return (await doc.get()).data();
  }

  Map<String, dynamic> setIdParam(Map<String, dynamic> params) {
    params[ID_KEY] = getNewFirestoreId();
    return params;
  }

  Future<Map<String, dynamic>> setUserRefParam(Map<String, dynamic> params, String uuid, [String paramName = "userRef"]) async {
    params[paramName] = getUserRef(uuid);
    return params;
  }

  FieldValue serverTimestamp() => FieldValue.serverTimestamp();
  Map<String, dynamic> setCreatedAtParam(Map<String, dynamic> params) {
    params["createdAt"] = serverTimestamp();
    return params;
  }
  Map<String, dynamic> setUpdatedAtParam(Map<String, dynamic> params) {
    params["updatedAt"] = serverTimestamp();
    return params;
  }
}
