import 'package:negarit/libs.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;

  AuthBloc({@required this.authRepo})
      : assert(authRepo != null),
        super(AuthLoading());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthLoad) {
      yield AuthLoading();
      Future.delayed(const Duration(seconds: 2));
      try {
        bool result = await authRepo.userLoggedInCheck();
        if (result) {
          List<dynamic> userInfo = await authRepo.getUserInfo();
          if (userInfo[0]) {
            yield Authenticated(userInfo[1]);
          } else {
            yield AuthFailed(userInfo[1]);
          }
        } else {
          yield AuthIntial();
        }
      } catch (e) {
        yield AuthFailed();
      }
    }

    if (event is AuthIntialize) {
      yield AuthIntial();
    }
    if (event is LogingIn) {
      yield LogingInPage();
    }

    if (event is AuthLogin) {
      yield LogingInProgress();

      try {
        List<dynamic> result =
            await authRepo.userLogin(event.email, event.password);
        if (result[0]) {
          List<dynamic> userInfo = await authRepo.getUserInfo();
          if (userInfo[0]) {
            yield Authenticated(userInfo[1]);
          } else {
            yield LogingInFailed(message: userInfo[1]);
          }
        } else {
          yield LogingInFailed(message: result[1]);
        }
      } catch (e) {
        yield LogingInFailed(message: "Error Loging ");
      }
    }

    if (event is AuthLogOut) {
      yield TheLoading();

      try {
        bool res = await authRepo.userLogoutCheck();
        if (res) {
          yield AuthIntial();
        }
      } catch (e) {
        yield AuthFailed("Error Loging out");
      }
    }
    if (event is RegisterUser) {
      yield RegistrationInProgress();
      try {
        bool result =
            await authRepo.userCreate(event.authModel, event.imgafile);
        if (result) {
          yield RegistrationSuccess(message: "success");
        } else {
          yield AuthFailed("registration failed");
        }
      } catch (e) {
        yield AuthFailed("registration error");
      }
    }

    if (event is ForgatPasswordIntializ) {
      yield ForgatePasswordPage();
    }

    if (event is ForgatePasswordEmial) {
      yield ForgatePasswordInProgres();

      try {
        bool state = await authRepo.forgatePasswordSendEmail(event.email);
        if (state) {
          yield ForgatePassswordTempCodeSent();
        } else {
          yield ForgatePasswordFailed(message: "error sending code");
        }
      } catch (e) {
        yield ForgatePasswordFailed(message: "failed");
      }
    }

    if (event is ForgatePasswordChange) {
      yield ForgatePasswordInProgres();
      try {
        bool state = await authRepo.forgatePasswordChange(
            event.email, event.password, event.newpassword);
        if (state) {
          yield ForgatePasswordSuccess();
        } else {
          yield ForgatePasswordFailed(message: "error reseting password");
        }
      } catch (e) {
        yield ForgatePasswordFailed(message: "password change error");
      }
    }
  }
}
