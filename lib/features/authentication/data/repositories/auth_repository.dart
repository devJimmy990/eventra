import 'package:eventra/features/authentication/data/data_source/auth_data_source.dart';
import 'package:eventra/features/landing/data/model/user.dart';

class AuthenticationRepository {
  final AuthenticationDataSource _dataSource;
  AuthenticationRepository(this._dataSource);

  Future<String?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _dataSource.loginWithEmailAndPassword(email, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> loginWithGoogle() async {
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

  Future<User?> createUserWithEmailAndPassword(
    User user,
    String password,
  ) async {
    try {
      return await _dataSource.createUserWithEmailAndPassword(user, password);
    } catch (e) {
      rethrow;
    }
  }
}
