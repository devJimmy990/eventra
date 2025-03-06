import 'package:cloud_firestore/cloud_firestore.dart' as store;

class FirebaseStoreService {
  final store.FirebaseFirestore _store = store.FirebaseFirestore.instance;

  store.FirebaseFirestore get instance => _store;
}
