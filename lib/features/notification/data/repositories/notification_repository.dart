import 'package:eventra/features/notification/data/model/notification.dart';
import 'package:eventra/features/notification/data/data_source/notification_data_source.dart';

class NotificationRepository {
  final NotificationDataSource _dataSource;
  NotificationRepository(this._dataSource);

  Future<bool> sendTopicNotification(String topic,
      {required Notification notification}) async {
    try {
      return await _dataSource.sendTopicNotification(
        topic,
        payload: notification.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> sendTokenNotification(String token,
      {required Notification notification}) async {
    try {
      return await _dataSource.sendTokenNotification(
        token,
        payload: notification.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> subscribeToUserTopics(List<String> topics) async {
    try {
      return await _dataSource.subscribeToUserTopics(topics);
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> subscribeToAdminTopics(List<String> topics) async {
    try {
      return await _dataSource.subscribeToAdminTopics(topics);
    } catch (e) {
      rethrow;
    }
  }
  Future<String> getFCMToken(String id) async{
    try {
      return await _dataSource.getFCMToken(id);
    } catch (e) {
      rethrow;
    }
  }
}
