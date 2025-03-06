import 'package:eventra/features/landing/data/model/user.dart';

sealed class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final String uid;
  Authenticated(this.uid);
}

class UnAuthenticated extends AuthenticationState {}

class AuthenticationError extends AuthenticationState {
  final String error;
  AuthenticationError(this.error);
}

class UserCreated extends AuthenticationState {
  final User user;
  UserCreated(this.user);
}
