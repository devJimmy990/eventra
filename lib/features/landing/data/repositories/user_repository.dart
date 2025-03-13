import 'dart:io';

import 'package:eventra/features/landing/data/data_source/user_data_source.dart';
import 'package:eventra/features/landing/data/model/user.dart';

class UserRepository {
  final UserDataSource _dataSource;

  UserRepository(this._dataSource);

  Future<User> getUserData(String uid) async {
    try {
      Map<String, dynamic> res = await _dataSource.getUserData(uid);
      return User.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUserData(
      String uid, Map<String, dynamic> updatedData) async {
    try {
      await _dataSource.updateUserData(uid, updatedData);
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

  Future<bool> updateUserProfile(
      {String? uid, required Map<String, String> data}) async {
    try {
      return await _dataSource.updateUserProfile(uid, data);
    } catch (e) {
      rethrow;
    }
  }
}
