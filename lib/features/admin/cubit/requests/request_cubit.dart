import 'package:eventra/core/helper/shared_preference.dart';
import 'package:eventra/features/admin/cubit/requests/request_state.dart';
import 'package:eventra/features/admin/data/data_source/admin_events_requests_data_source.dart';
import 'package:eventra/features/admin/data/repositories/admin_events_requests_repository.dart';
import 'package:eventra/features/user/home/data/model/request_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum EventFilter { upcoming, past }

class AdminEventRequestCubit extends Cubit<AdminEventRequestState> {
  AdminEventRequestCubit() : super(EventRequestInitial()) {
    getRequests();
  }

  void getRequests() async {
    emit(EventRequestLoading());
    try {
      String uid = SharedPreference.getString(key: "uid")!;
      List<RequestEvent> requests =
          await AdminEventsRequestsRepository(AdminEventsRequestsDataSource())
              .getAdminEventsRequests(uid);
      emit(requests.isEmpty
          ? EventRequestEmpty()
          : EventRequestsLoaded(requests));
    } catch (e) {
      emit(EventRequestError(e.toString()));
    }
  }
}
