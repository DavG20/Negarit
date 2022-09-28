import 'package:negarit/libs.dart';

class AuthState extends Equatable {
  List<Object> get props => [];
}

// State os authentications
class AuthLoading extends AuthState {}

class TheLoading extends AuthState {}

class AuthIntial extends AuthState {}

class Authenticated extends AuthState {
  final AuthModel _authModel;

  Authenticated(this._authModel);

  List<Object> get props => [_authModel];
}

class NotAuthenticated extends AuthState {}

class AuthFailed extends AuthState {
  final String message;

  AuthFailed([this.message]);

  List<Object> get props => [message];
}

class RegistrationPageLoading extends AuthState {}

class RegistrationInProgress extends AuthState {}

class RegistrationSuccess extends AuthState {
  final String message;
  RegistrationSuccess({this.message});

  List<Object> get props => [message];
}

class LogingInProgress extends AuthState {}

class LogingInPage extends AuthState {}

class LogingInFailed extends AuthState {
  final String message;

  LogingInFailed({this.message});

  List<Object> get props => [message];
}

// forgate password states
class ForgatePasswordPage extends AuthState {}

class ForgatePasswordInProgres extends AuthState {}

class ForgatePasswordFailed extends AuthState {
  final String message;

  ForgatePasswordFailed({this.message});

  List<Object> get props => [message];
}

class ForgatePassswordTempCodeSent extends AuthState {}

class ForgatePasswordSuccess extends AuthState {}
