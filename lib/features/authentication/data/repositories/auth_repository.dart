import 'package:eventra/features/authentication/data/data_source/auth_data_source.dart';

class AuthenticationRepository {
  final AuthenticationDataSource _dataSource;
  AuthenticationRepository(this._dataSource);

  Future<String> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _dataSource.loginWithEmailAndPassword(email, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> loginWithGoogle() async {
    try {
      return await _dataSource.loginWithGoogle();
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> logout() async {
    try {
      return await _dataSource.logout();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _dataSource.createUserWithEmailAndPassword(email, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> storeUserToken(String id) async {
    try {
      return await _dataSource.storeUserToken(id);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteAccount(String id) async {
    try {
      return await _dataSource.deleteAccount(id);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> storeUserData(Map<String, dynamic> user) {
    try {
      return _dataSource.storeUserData(user);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getUserById(String uid) async{
    try {
      return await _dataSource.getUserById(uid);
    } catch (e) {
      rethrow;
    }
  }
}
