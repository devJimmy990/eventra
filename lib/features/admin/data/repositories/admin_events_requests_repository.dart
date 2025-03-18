import 'package:eventra/features/admin/data/data_source/admin_events_requests_data_source.dart';
import 'package:eventra/features/user/home/data/model/request_event.dart';

class AdminEventsRequestsRepository {
  final AdminEventsRequestsDataSource _dataSource;

  AdminEventsRequestsRepository(this._dataSource);

  Stream<List<RequestEvent>> getAdminEventsRequests(String uid) {
    try {
      return _dataSource.getAdminEventsRequests(uid).map((list) =>
          list.map((eventData) => RequestEvent.fromJson(eventData)).toList());
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> onRequestApproved(RequestEvent request) async {
    try {
      return _dataSource.onRequestApproved(request);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> onRejectRequest(String id,
      {required Map<String, int> data}) async {
    try {
      return _dataSource.onRejectRequest(id, data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> onAcceptRequest(String id,
      {required Map<String, int> data}) async {
    try {
      return _dataSource.onAcceptRequest(id, data: data);
    } catch (e) {
      rethrow;
    }
  }
}
