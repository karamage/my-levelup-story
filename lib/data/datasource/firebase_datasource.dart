import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseDatasource {
  FirebaseFirestore _db;
  FirebaseAuth _auth;

  get db => _db;
  get auth => _auth;

  initializeApp() async {
    await Firebase.initializeApp();
    _auth = FirebaseAuth.instance;
    _db = FirebaseFirestore.instance;
  }
}
