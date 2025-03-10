import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/features/user/notification/cubit/notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());
}
