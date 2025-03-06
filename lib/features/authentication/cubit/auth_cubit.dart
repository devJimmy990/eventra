import 'package:eventra/core/helper/shared_preference.dart';
import 'package:eventra/features/landing/data/model/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eventra/features/authentication/cubit/auth_state.dart';
import 'package:eventra/features/authentication/data/data_source/auth_data_source.dart';
import 'package:eventra/features/authentication/data/repositories/auth_repository.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());
  void checkAuthentication() {
    String? uid = SharedPreference.getString(key: "uid");
    if (uid != null) {
      emit(Authenticated(uid));
    } else {
      emit(UnAuthenticated());
    }
  }

  void loginWithEmailAndPassword(String email, String password) async {
    emit(AuthenticationLoading());
    try {
      String? uid = await AuthenticationRepository(AuthenticationDataSource())
          .loginWithEmailAndPassword(email, password);
      if (uid == null) {
        emit(AuthenticationError("Invalid email or password"));
        return;
      }
      SharedPreference.setString(key: "uid", value: uid);
      emit(Authenticated(uid));
    } catch (e) {
      emit(AuthenticationError(e.toString()));
    }
  }

  void loginWithGoogle() async {
    emit(AuthenticationLoading());
    try {
      String? uid = await AuthenticationRepository(AuthenticationDataSource())
          .loginWithGoogle();
      if (uid == null) {
        emit(AuthenticationError("Invalid Login with Google"));
        return;
      }
      SharedPreference.setString(key: "uid", value: uid);
      emit(Authenticated(uid));
    } catch (e) {
      emit(AuthenticationError(e.toString()));
    }
  }

  void logout() async {
    try {
      bool isLoggedOut =
          await AuthenticationRepository(AuthenticationDataSource()).logout();
      if (!isLoggedOut) {
        emit(AuthenticationError("Error logging out"));
        return;
      }
      SharedPreference.remove(key: "uid");
      emit(UnAuthenticated());
    } catch (e) {
      emit(AuthenticationError(e.toString()));
    }
  }

  Future<void> createUserWithEmailAndPassword(
      User user, String password) async {
    emit(AuthenticationLoading());
    try {
      User? model = await AuthenticationRepository(AuthenticationDataSource())
          .createUserWithEmailAndPassword(user, password);
      if (model == null) {
        emit(AuthenticationError("Error creating user"));
        return;
      }
      SharedPreference.setString(key: "uid", value: model.id!);
      emit(UserCreated(model));
    } catch (e) {
      emit(AuthenticationError(e.toString()));
    }
    return;
  }
}
