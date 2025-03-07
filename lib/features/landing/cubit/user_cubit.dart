import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/core/helper/shared_preference.dart';
import 'package:eventra/features/landing/data/model/user.dart';
import 'package:eventra/features/landing/cubit/user_state.dart';
import 'package:eventra/features/landing/data/data_source/user_data_source.dart';
import 'package:eventra/features/landing/data/repositories/user_repository.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  User? _user;
  void loadUser() async {
    emit(UserLoading());
    try {
      final String? uid = SharedPreference.getString(key: "uid");
      if (uid == null) {
        emit(UserNotAuthenticated());
        return;
      }
      _user = await UserRepository(UserDataSource()).getUserData(uid);
      emit(UserLoaded(_user!));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  void setUser(User user) {
    emit(UserLoaded(user));
  }

  User? get user => _user;
}
