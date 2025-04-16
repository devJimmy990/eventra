import 'package:eventra/features/landing/data/model/user.dart';

sealed class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserImageUploaded extends UserState {
  final String url;
  UserImageUploaded(this.url);
}

class UserLoaded extends UserState {
  final User user;
  UserLoaded(this.user);
}

class UserError extends UserState {
  final String error;
  UserError(this.error);
}
