import 'package:negarit/libs.dart';

class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthLoad extends AuthEvent {}

class AuthIntialize extends AuthEvent {
  List<Object> get props => [];
}

class AuthLogin extends AuthEvent {
  final String email;
  final String password;

  AuthLogin({this.email, this.password});

  List<Object> get props => [email, password];
}

class LogingIn extends AuthEvent {}

class AuthLogOut extends AuthEvent {}

class RegisterUser extends AuthEvent {
  final File imgafile;
  final AuthModel authModel;

  RegisterUser({this.imgafile, this.authModel});

  List<Object> get props => [imgafile, authModel];
}

class ForgatPasswordIntializ extends AuthEvent {}

class ForgatePasswordEmial extends AuthEvent {
  final String email;
  ForgatePasswordEmial({this.email});

  List<Object> get props => [email];
}

class ForgatePasswordChange extends AuthEvent {
  final String email, password, recode;
  ForgatePasswordChange({this.email, this.password, this.recode});

  List<Object> get props => [email, password, recode];
}
