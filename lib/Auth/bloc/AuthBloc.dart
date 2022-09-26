import 'package:negarit/libs.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;

  AuthBloc({this.authRepo}) : super(AuthLoading());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is Loading) {
      yield AuthLoading();
      Future.delayed(const Duration(seconds: 2));
      try {} catch (e) {}
    }

    if (event is AuthIntialize) {
      yield AuthIntialized();
    }
    if (event is LogingIn) {
      yield LogingInPage();
    }

    if (event is AuthLogin) {
      yield LogingInProgress();

      try {} catch (e) {
        yield LogingInFailed(message: "Error Loging ");
      }
    }

    if (event is AuthLogOut) {
      yield TheLoading();

      try {} catch (e) {
        yield AuthFailed("Error Loging out");
      }
    }
    if (event is UserRegistration) {
      yield RegistrationInProgress();
      try {} catch (e) {
        yield AuthFailed("registration error");
      }
    }

    if (event is ForgatPasswordIntializ) {
      yield ForgatePasswordPage();
    }

    if (event is ForgatePasswordEmial) {
      yield ForgatePasswordInProgres();

      try {} catch (e) {
        ForgatePasswordFailed(message: "Forgate password reset failed");
      }
    }
  }
}
