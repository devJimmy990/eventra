import 'package:eventra/features/user/home/data/model/booked_event.dart';
import 'package:eventra/features/user/home/data/model/request_event.dart';
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

  bookEvent(RequestEvent event) async {
    try {
      Map<String, dynamic> data = await _dataSource.bookEvent(event.toJson());
      return RequestEvent.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
