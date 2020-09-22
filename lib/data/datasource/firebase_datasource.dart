import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_levelup_story/data/models/user.dart' as luser;
import 'package:my_levelup_story/util/local_storage_manager.dart';

class FirebaseDatasource {
  FirebaseFirestore _db;
  FirebaseAuth _auth;

  get db => _db;
  get auth => _auth;

  final String USERS_PATH = "users";
  final String ITEMS_PATH = "items";

  initializeApp() async {
    //await new Future.delayed(new Duration(seconds: 1));
    await Firebase.initializeApp();
    _auth = FirebaseAuth.instance;
    _db = FirebaseFirestore.instance;
  }

  DocumentReference getUserRef(uuid) => _db.collection(USERS_PATH).document(uuid);
  DocumentReference getItemRef(uuid) => _db.collection(ITEMS_PATH).document(uuid);
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

  String getNewFirestoreId() {
    return _db.collection('_').doc().id;
  }

  Future<Map<String, dynamic>> setSubUserParam(Map<String, dynamic> params, String uuid, [String paramName = "user"]) async {
    DocumentSnapshot userDoc = await getUserDoc(uuid);
    final user = luser.User.fromJson(userDoc.data());
    params[paramName] = luser.User.getSubUserParams(user);
    return params;
  }

  Map<String, dynamic> setIdParam(Map<String, dynamic> params) {
    params["id"] = getNewFirestoreId();
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
