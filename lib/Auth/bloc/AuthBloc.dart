import 'package:negarit/libs.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthLoading()) {
    on<AuthEvent>((event, emit) {});
  }
}
