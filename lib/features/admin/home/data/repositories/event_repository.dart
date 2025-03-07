import 'package:eventra/features/admin/event/model/admin_event.dart';
import 'package:eventra/features/admin/home/data/data_source/event_data_source.dart';

class EventRepository {
  final EventDataSource _dataSource;

  EventRepository(this._dataSource);

  Future<void> addEvent(AdminEvent event) async {
    await _dataSource.addEvent(event);
  }

  Stream<List<AdminEvent>> getEvents() {
    return _dataSource.getEvents();
  }

  Future<void> updateEvent(AdminEvent event) async {
    await _dataSource.updateEvent(event);
  }

  Future<void> deleteEvent(AdminEvent event) async {
    await _dataSource.deleteEvent(event);
  }
}
