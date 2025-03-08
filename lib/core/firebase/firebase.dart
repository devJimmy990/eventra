import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:cloud_firestore/cloud_firestore.dart' as firebase_store;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Firebase {
  static Firebase? _instance;
  late final firebase_auth.FirebaseAuth _auth;
  late final firebase_store.FirebaseFirestore _store;
  late final firebase_storage.FirebaseStorage _storage;

  Firebase._internal() {
    _auth = firebase_auth.FirebaseAuth.instance;
    _store = firebase_store.FirebaseFirestore.instance;
    _storage = firebase_storage.FirebaseStorage.instance;
  }

  factory Firebase() {
    return _instance ??= Firebase._internal();
  }
  firebase_auth.FirebaseAuth get auth => _auth;
  firebase_store.FirebaseFirestore get store => _store;
  firebase_storage.FirebaseStorage get storage => _storage;
}
