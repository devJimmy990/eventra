import 'dart:io';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:eventra/features/landing/data/model/user.dart';
import 'package:eventra/features/landing/cubit/user_state.dart';
import 'package:eventra/features/landing/data/data_source/user_data_source.dart';
import 'package:eventra/features/landing/data/repositories/user_repository.dart';

class UserCubit extends HydratedCubit<UserState> {
  UserCubit() : super(UserInitial());

  void setUser(Map<String, dynamic> user) {
    emit(UserLoaded(User.fromJson(user)));
  }

  Future<void> uploadImage(File pickedImage) async {
    try {
      final String url =
          await UserRepository(UserDataSource()).uploadImage(pickedImage);
      emit(UserImageUploaded(url));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> updateUserProfile({required Map<String, String> data}) async {
    try {
      if (state is! UserLoaded) return;
      final user = (state as UserLoaded).user;
      await UserRepository(UserDataSource()).updateUser(user.id, json: data);
      emit(UserLoaded(User.copyWith(user, json: data)));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> reset() async => await clear();

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    try {
      return UserLoaded(User.fromJson(json["user"]));
    } catch (e) {
      return null;
    }
  }

  User? get user => state is UserLoaded ? (state as UserLoaded).user : null;

  @override
  Map<String, dynamic>? toJson(UserState state) {
    if (state is UserLoaded) {
      return {"user":state.user.toJson()};
    }
    return null;
  }
}
