import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/features/notification/cubit/notification_state.dart';
import 'package:eventra/features/notification/data/data_source/notification_data_source.dart';
import 'package:eventra/features/notification/data/repositories/notification_repository.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  Future<void> subscribeToTopic() async {
    try {
      Map<String, dynamic> res = await NotificationRepository(
        NotificationDataSource(),
      ).subscribeToTopic(topic: "new_event");

      debugPrint("subscribeToTopic: $res");
      if (res["notification"] != null) {
        emit(NotificationSubscribed());
      } else {}
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }
}
