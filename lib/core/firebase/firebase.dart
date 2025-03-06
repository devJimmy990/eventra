import 'package:eventra/core/firebase/firebase_auth.dart';
import 'package:eventra/core/firebase/firebase_store.dart';

class Firebase {
  static Firebase? _instance;
  late final FirebaseAuthService auth;
  late final FirebaseStoreService store;

  Firebase._internal() {
    auth = FirebaseAuthService();
    store = FirebaseStoreService();
  }

  factory Firebase() {
    return _instance ??= Firebase._internal();
  }
}
