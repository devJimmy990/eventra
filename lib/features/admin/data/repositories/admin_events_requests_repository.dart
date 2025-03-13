import 'package:eventra/features/admin/data/data_source/admin_events_requests_data_source.dart';
import 'package:eventra/features/user/home/data/model/request_event.dart';

class AdminEventsRequestsRepository {
  final AdminEventsRequestsDataSource _dataSource;

  AdminEventsRequestsRepository(this._dataSource);

  Future<List<RequestEvent>> getAdminEventsRequests(String uid) async {
    try {
      List<Map<String, dynamic>> data =
          await _dataSource.getAdminEventsRequests(uid);
      return data.map((eventData) => RequestEvent.fromJson(eventData)).toList();
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

  Future<bool> onRejectRequest(
      {required String id, required Map<String, int> data}) async {
    try {
      print("reject-flow: repo");

      return _dataSource.onRejectRequest(id: id, data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> onAcceptRequest(
      {required String id, required Map<String, int> data}) async {
    try {
      return _dataSource.onAcceptRequest(id: id, data: data);
    } catch (e) {
      rethrow;
    }
  }
}
