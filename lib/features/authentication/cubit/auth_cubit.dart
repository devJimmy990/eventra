import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:eventra/core/helper/shared_preference.dart';
import 'package:eventra/features/authentication/cubit/auth_state.dart';
import 'package:eventra/features/authentication/data/data_source/auth_data_source.dart';
import 'package:eventra/features/authentication/data/repositories/auth_repository.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  Future<void> _storeUserToken(String id) async {
    try {
      String? token = await AuthenticationRepository(AuthenticationDataSource())
          .storeUserToken(id);
      if (token != null) {
        SharedPreference.setString(key: "fcm-token", value: token);
      }
    } catch (e) {
      rethrow;
    }
  }

  // void checkAuthentication() {
  //   String? uid = SharedPreference.getString(key: "uid");
  //   if (uid != null) {
  //     emit(Authenticated(uid));
  //   } else {
  //     emit(UnAuthenticated());
  //   }
  // }

  void loginWithEmailAndPassword(String email, String password) async {
    emit(AuthenticationLoading());
    try {
      String uid = await AuthenticationRepository(AuthenticationDataSource())
          .loginWithEmailAndPassword(email, password);
      SharedPreference.setString(key: "uid", value: uid);
      _storeUserToken(uid);
      emit(Authenticated(uid));
    } catch (e) {
      emit(AuthenticationError(e.toString()));
    }
  }

  void loginWithGoogle() async {
    emit(AuthenticationLoading());
    try {
      Map<String, dynamic>? user =
          await AuthenticationRepository(AuthenticationDataSource())
              .loginWithGoogle();
      if (user == null) {
        emit(UnAuthenticated());
      } else {
        storeUserData(user);
      }
    } catch (e) {
      emit(AuthenticationError(e.toString()));
    }
  }

  void logout() async {
    try {
      await AuthenticationRepository(AuthenticationDataSource()).logout();
      SharedPreference.remove(key: "uid");
      emit(UnAuthenticated());
      return;
    } catch (e) {
      emit(AuthenticationError(e.toString()));
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    emit(AuthenticationLoading());
    try {
      String uid = await AuthenticationRepository(AuthenticationDataSource())
          .createUserWithEmailAndPassword(email, password);
      emit(Authenticated(uid));
    } catch (e) {
      emit(AuthenticationError(e.toString()));
    }
    return;
  }

  Future<void> storeUserData(Map<String, dynamic> user) async {
    emit(AuthenticationLoading());
    try {
      await AuthenticationRepository(AuthenticationDataSource())
          .storeUserData(user);
      SharedPreference.setString(key: "uid", value: user["id"]);
      _storeUserToken(user["id"]);
      emit(AuthenticationSuccess(user));
    } catch (e) {
      emit(AuthenticationError(e.toString()));
    }
    return;
  }

  Future<void> getUserById(String uid) async {
    emit(AuthenticationLoading());
    try {
      Map<String, dynamic> user =
          await AuthenticationRepository(AuthenticationDataSource())
              .getUserById(uid);
      emit(AuthenticationSuccess(user));
    } catch (e) {
      emit(AuthenticationError(e.toString()));
    }
    return;
  }

  Future<void> deleteAccount(String id) async {
    try {
      bool isDeleted =
          await AuthenticationRepository(AuthenticationDataSource())
              .deleteAccount(id);
      if (isDeleted) {
        SharedPreference.clear();
        emit(UnAuthenticated());
      }
    } catch (e) {
      emit(AuthenticationError(e.toString()));
    }
  }

  bool get isAuthenticated => state is Authenticated;
}
