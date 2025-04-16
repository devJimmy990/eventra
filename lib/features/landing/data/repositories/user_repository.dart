import 'dart:io';

import 'package:eventra/features/landing/data/data_source/user_data_source.dart';

class UserRepository {
  final UserDataSource _dataSource;

  UserRepository(this._dataSource);

  Future<void> updateUser(String uid,
      {required Map<String, dynamic> json}) async {
    try {
      await _dataSource.updateUser(uid, json: json);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> uploadImage(File image) async {
    try {
      return await _dataSource.uploadImage(image);
    } catch (e) {
      rethrow;
    }
  }
}
