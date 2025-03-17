import 'package:eventra/features/user/event/data/models/booked_event.dart';
import 'package:eventra/features/user/home/data/data_source/user_event_data_source.dart';

class UserEventRepository {
  final UserEventDataSource _dataSource;

  UserEventRepository(this._dataSource);

  Stream<List<UserEvent>> getEventsStream() {
    return _dataSource
        .getEventsStream()
        .map((list) => list.map((e) => UserEvent.fromJson(e)).toList());
  }
}
