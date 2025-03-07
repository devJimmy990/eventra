import 'package:eventra/features/admin/event/model/event.dart';
import 'package:eventra/features/admin/home/data/data_source/event_data_source.dart';

class EventRepository {
  final EventDataSource _dataSource;

  EventRepository(this._dataSource);

  Future<void> addEvent(Event event) async {
    await _dataSource.addEvent(event);
  }

  Stream<List<Event>> getEvents() {
    return _dataSource.getEvents();
  }

  Future<void> updateEvent(Event event) async {
    await _dataSource.updateEvent(event);
  }

  Future<void> deleteEvent(Event event) async {
    await _dataSource.deleteEvent(event);
  }
}
