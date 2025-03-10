import 'package:eventra/features/user/notification/data/data_source/notification_data_source.dart';
import 'package:eventra/features/user/notification/data/model/notification.dart';

class NotificationRepository {
  final NotificationDataSource _dataSource;
  NotificationRepository(this._dataSource);

  Future<List<Notification>> getNotifications(String uid) async {
    try {
      List<Map<String, dynamic>> notifications =
          await _dataSource.getNotifications(uid);
      return notifications.map((data) => Notification.fromJson(data)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<Notification> addNotification(
      Notification notification, String uid) async {
    try {
      Map<String, dynamic> data =
          await _dataSource.addNotification(notification.toJson(), uid);
      return Notification.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
