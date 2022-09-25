import 'package:negarit/libs.dart';

class AuthState extends Equatable {
  List<Object> get props => [];
}

class AuthLoading extends AuthState {}

class AuthIntialized extends AuthState {}

class Authenticated extends AuthState {
  final AuthModel _authModel;

  Authenticated(this._authModel);

  List<Object> get props => [_authModel];
}

class NotAuthenticated extends AuthState {}

class AuthFailed extends AuthState {
  final String message;

  AuthFailed(this.message);

  List<Object> get props => [message];
}

class ForgatePasswordInProgres extends AuthState {}
