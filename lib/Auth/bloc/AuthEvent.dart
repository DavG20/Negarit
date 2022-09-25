import 'package:equatable/equatable.dart';

class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

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

class ForgatPasswordIntializ extends AuthEvent {}
