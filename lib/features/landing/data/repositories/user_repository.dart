import 'package:eventra/features/landing/data/data_source/user_data_source.dart';
import 'package:eventra/features/landing/data/model/user.dart';

class UserRepository {
  final UserDataSource _dataSource;

  UserRepository(this._dataSource);

  Future<User> getUserData(String uid) async {
    try {
      Map<String, dynamic> res = await _dataSource.getUserData(uid);
      res.addAll({"id": uid});
      return User.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}
