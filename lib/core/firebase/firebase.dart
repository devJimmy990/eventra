import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:cloud_firestore/cloud_firestore.dart' as firebase_store;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_messaging/firebase_messaging.dart'
    as firebase_messaging;

class Firebase {
  static Firebase? _instance;
  late firebase_auth.FirebaseAuth _auth;
  late firebase_store.FirebaseFirestore _store;
  late firebase_storage.FirebaseStorage _storage;
  late firebase_messaging.FirebaseMessaging _messaging;

  Firebase._internal() {
    _auth = firebase_auth.FirebaseAuth.instance;
    _store = firebase_store.FirebaseFirestore.instance;
    _storage = firebase_storage.FirebaseStorage.instance;
    _messaging = firebase_messaging.FirebaseMessaging.instance;
  }

  factory Firebase() {
    return _instance ??= Firebase._internal();
  }
  firebase_auth.FirebaseAuth get auth => _auth;
  firebase_store.FirebaseFirestore get store => _store;
  firebase_storage.FirebaseStorage get storage => _storage;
  firebase_messaging.FirebaseMessaging get messaging => _messaging;
}
