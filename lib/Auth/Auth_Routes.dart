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
            return  LoginPage();
          } else {
            return const SnackBar(content: Text("Login Faild"));
          }
        },
      ),
    );
  }
}
