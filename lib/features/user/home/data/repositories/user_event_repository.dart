import 'package:eventra/features/user/event/data/models/booked_event.dart';
import 'package:eventra/features/user/home/data/data_source/user_event_data_source.dart';

class UserEventRepository {
  final UserEventDataSource _dataSource;

  UserEventRepository(this._dataSource);

  Future<List<UserEvent>> getEvents() async {
    try {
      List<Map<String, dynamic>> list = await _dataSource.getEvents();
      return list.map((e) => UserEvent.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
