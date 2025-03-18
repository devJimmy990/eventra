import 'package:eventra/core/helper/shared_preference.dart';
import 'package:eventra/features/notification/data/model/notification.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/features/notification/cubit/notification_state.dart';
import 'package:eventra/features/notification/data/data_source/notification_data_source.dart';
import 'package:eventra/features/notification/data/repositories/notification_repository.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  Future<void> subscribeToUserTopics(String id) async {
    try {
      String? token = await NotificationRepository(
        NotificationDataSource(),
      ).subscribeToUserTopics(["new_event"]);
      emit(NotificationSubscribed());
      if (token != null) {
        SharedPreference.setString(key: "fcm-token", value: token);
      }
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }

  Future<void> subscribeToAdminTopics(String id) async {
    try {
      String? token = await NotificationRepository(
        NotificationDataSource(),
      ).subscribeToAdminTopics(["request-$id"]);
      if (token != null) {
        SharedPreference.setString(key: "fcm-token", value: token);
      }
      emit(NotificationSubscribed());
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }

  Future<void> sendTokenNotification(
      String token, Notification notification) async {
    try {
      await NotificationRepository(
        NotificationDataSource(),
      ).sendTokenNotification(
        token,
        notification: notification,
      );
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }

  Future<void> sendTopicNotification(
      String topic, Notification notification) async {
    try {
      await NotificationRepository(
        NotificationDataSource(),
      ).sendTopicNotification(
        topic,
        notification: notification,
      );
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }
}
