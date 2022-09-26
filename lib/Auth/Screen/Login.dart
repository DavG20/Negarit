import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:negarit/libs.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "auth/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldglobalKey =
      GlobalKey<ScaffoldMessengerState>();
  final GlobalKey<FormState> _formglobalkey = GlobalKey<FormState>();

  bool _autoValidate = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool validateEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    return (regExp.hasMatch(email) ? true : false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _scaffoldglobalKey,
        body: SafeArea(
            child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LogingInProgress) {
              const snackBar = SnackBar(content: Text("Loading ..."));
              _scaffoldglobalKey.currentState.showSnackBar(snackBar);
            } else if (state is LogingInFailed) {
              final snackBar = SnackBar(content: Text(state.message));
              _scaffoldglobalKey.currentState.showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  key: _formglobalkey,
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ),
                ),
              ],
            );
          },
        )),
      ),
    );
  }
}
