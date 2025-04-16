sealed class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class UnAuthenticated extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final Map<String, dynamic> json;
  AuthenticationSuccess(this.json);
}

class Authenticated extends AuthenticationState {
  final String uid;
  Authenticated(this.uid);
}

class AuthenticationError extends AuthenticationState {
  final String error;
  AuthenticationError(this.error);
}
