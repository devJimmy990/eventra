import 'dart:io';

import 'package:eventra/features/admin/event/model/admin_event.dart';
import 'package:eventra/features/admin/home/data/data_source/event_data_source.dart';

class EventRepository {
  final EventDataSource _dataSource;

  EventRepository(this._dataSource);

  Future<String> addEvent(AdminEvent event) async {
    try {
      return await _dataSource.addEvent(event);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AdminEvent>> getEvents(String uid) async {
    try {
      List<Map<String, dynamic>> list = await _dataSource.getEvents(uid);
      List<AdminEvent> admins =
          list.map((event) => AdminEvent.fromJson(event)).toList();
      print(admins.length);
      return admins;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateEvent(AdminEvent event) async {
    await _dataSource.updateEvent(event);
  }

  Future<void> deleteEvent(AdminEvent event) async {
    await _dataSource.deleteEvent(event);
  }

  Future<String> uploadImage(File image) async {
    try {
      return await _dataSource.uploadImage(image);
    } catch (e) {
      rethrow;
    }
  }
}
