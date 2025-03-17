import 'dart:io';

import 'package:eventra/features/admin/data/model/admin_event.dart';
import 'package:eventra/features/admin/data/data_source/admin_event_data_source.dart';

class AdminEventRepository {
  final AdminEventDataSource _dataSource;

  AdminEventRepository(this._dataSource);

  Future<AdminEvent> addEvent(AdminEvent event) async {
    try {
      return AdminEvent.fromJson(await _dataSource.addEvent(event));
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AdminEvent>> getEvents(String uid) async {
    try {
      List<Map<String, dynamic>> list = await _dataSource.getEvents(uid);
      List<AdminEvent> admins =
          list.map((event) => AdminEvent.fromJson(event)).toList();
      return admins;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateEvent(String id,
      {required Map<String, dynamic> data}) async {
    try {
      return await _dataSource.updateEvent(id, data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteEvent(String id) async {
    try {
      return await _dataSource.deleteEvent(id);
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
