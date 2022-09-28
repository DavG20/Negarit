import 'package:negarit/Auth/Screen/Welcome_Loader.dart';
import 'package:negarit/libs.dart';

class AuthRoutes extends StatefulWidget {
  @override
  State<AuthRoutes> createState() => _AuthRoutesState();
}

class _AuthRoutesState extends State<AuthRoutes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return WelcomeLaoder();
          }
          if (state is LogingInPage) {
            return LoginPage();
          }
          if (state is LogingInPage ||
              state is LogingInProgress ||
              state is LogingInFailed ||
              state is LogingInPage) {
            return LoginPage();
          }

          if (state is ForgatePasswordPage ||
              state is ForgatePasswordSuccess ||
              state is ForgatePasswordFailed ||
              state is ForgatePassswordTempCodeSent ||
              state is ForgatePasswordInProgres) {
            return LoginPage();
          }

          // if (state is Authenticated) {
          //   final RegisterRepository registerRepository = RegisterRepository(
          //     dataProvider: RegisterDataProvider(
          //       httpClient: http.Client(),
          //     ),
          //   );
          //   return Register(
          //     registerRepository: registerRepository,
          //   );
          // }
          else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
