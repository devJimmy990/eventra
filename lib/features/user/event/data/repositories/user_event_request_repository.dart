import 'package:eventra/features/user/event/data/data_source/user_event_request_data_source.dart';
import 'package:eventra/features/user/home/data/model/request_event.dart';

class UserEventRequestRepository {
  final UserEventRequestDataSource _dataSource;

  UserEventRequestRepository(this._dataSource);

  Future<RequestEvent> bookEvent(RequestEvent event) async {
    try {
      Map<String, dynamic> data = await _dataSource.bookEvent(event.toJson());
      return RequestEvent.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<RequestEvent?> ifUserHasRequestWithEvent(
      {required String userId, required String eventId}) async {
    try {
      Map<String, dynamic>? data = await _dataSource.ifUserHasRequestWithEvent(
          uid: userId, eid: eventId);
      return data == null ? null : RequestEvent.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  
}
