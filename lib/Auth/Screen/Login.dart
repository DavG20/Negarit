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
    return (!regExp.hasMatch(email) ? false : true);
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
                    child: Form(
                      key: _formglobalkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: TextFormField(
                              autofocus: false,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Empty Filed";
                                } else if (!validateEmail(val)) {
                                  return "Invalid Email";
                                } else {
                                  return null;
                                }
                              },
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  letterSpacing: 1),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 10),
                                hintText: "Email",
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[900],
                                ),
                                filled: true,
                                fillColor: Colors.grey[200],
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent, width: 2.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent, width: 2.0),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            child: TextFormField(
                              autofocus: false,
                              validator: (val) =>
                                  val.isEmpty ? 'Empty Field' : null,
                              controller: passwordController,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              style: const TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                letterSpacing: 1.0,
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 20.0, right: 20.0, top: 10),
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey[900],
                                ),
                                filled: true,
                                fillColor: Colors.grey[200],
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent, width: 2.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent, width: 2.0),
                                ),
                              ),
                            ),
                          ),
                          SpringButton(
                            SpringButtonType.OnlyScale,
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: const Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1.5),
                                ),
                              ),
                            ),
                            scaleCoefficient: 0.9,
                            useCache: false,
                            onTap: () {
                              if (_formglobalkey.currentState.validate()) {
                                String email = emailController.text;
                                String password = passwordController.text;

                                BlocProvider.of<AuthBloc>(context,
                                        listen: false)
                                    .add(
                                  AuthLogin(email: email, password: password),
                                );
                              } else {
                                setState(() {
                                  _autoValidate = true;
                                });
                              }
                            },
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "I don't have account",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1.0),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                TextButton(
                                  child: const Text(
                                    'SignUp',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.deepOrange,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 1.0),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(UserRegistration.routeName);
                                    BlocProvider.of<AuthBloc>(context,
                                            listen: false)
                                        .add(AuthIntialize());
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  child: const Text(
                                    'Back',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.deepOrange,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 1.0),
                                  ),
                                  onPressed: () {
                                    BlocProvider.of<AuthBloc>(context,
                                            listen: false)
                                        .add(AuthIntialize());
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
