import 'package:negarit/libs.dart';

class AuthRepo {
  final AuthDataProvider authDataProvider;

  AuthRepo({this.authDataProvider});

  Future<bool> userCreate(AuthModel authModel, File profilepic) async {
    return await authDataProvider.createUser(authModel, profilepic);
  }

  Future<bool> userLoggedInCheck() async {
    return await authDataProvider.userLoggedInCheck();
  }

  Future<bool> userLogoutCheck() async {
    return await authDataProvider.userLogoutCheck();
  }

  Future<List<dynamic>> userLogin(String email, String password) async {
    return await authDataProvider.userLogIn(email, password);
  }

  Future<List<dynamic>> getUserInfo() async {
    return await authDataProvider.getUserInfo();
  }

  Future<bool> forgatePasswordSendEmail(String email) async {
    return await authDataProvider.forgatePasswordSendEmail(email);
  }

  Future<bool> forgatePasswordChange(
      String email, String password, String newPassword) async {
    return await authDataProvider.forgatePasswordChange(
        email, password, newPassword);
  }
}
