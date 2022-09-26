import 'package:negarit/libs.dart';

class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthLoad extends AuthEvent {}

class Loading extends AuthEvent {
  List<Object> get props => [];
}

class AuthIntialize extends AuthEvent {
  List<Object> get props => [];
}

class AuthLogin extends AuthEvent {
  final String username;
  final String password;

  AuthLogin(this.username, this.password);

  List<Object> get props => [username, password];
}

class LogingIn extends AuthEvent {}

class AuthLogOut extends AuthEvent {}

class RegisterUser extends AuthEvent {
  final File imgafile;
  final AuthModel authModel;

  RegisterUser({required this.imgafile, required this.authModel});

  List<Object> get props => [imgafile, authModel];
}

class ForgatPasswordIntializ extends AuthEvent {}

class ForgatePasswordEmial extends AuthEvent {
  final String email;
  ForgatePasswordEmial({required this.email});

  List<Object> get props => [email];
}

class ForgatePasswordChange extends AuthEvent {
  final String email, password, recode;
  ForgatePasswordChange(
      {required this.email, required this.password, required this.recode});

  List<Object> get props => [email, password, recode];
}
