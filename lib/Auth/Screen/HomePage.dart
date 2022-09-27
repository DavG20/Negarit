import 'package:negarit/libs.dart';

class HomePage extends StatelessWidget {
  static const routeName = "auth/homepage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/back.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black54,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 2,
              ),
              Container(
                width: 80,
                child: Image.asset("assets/background.png"),
              ),
              const Text(
                "Negarit",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                    color: Colors.white),
              ),
              const Text(
                "Let's Share Information!",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.7,
                  color: Colors.white,
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              SpringButton(
                SpringButtonType.OnlyScale,
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[800],
                          letterSpacing: 1),
                    ),
                  ),
                ),
                scaleCoefficient: 0.9,
                useCache: false,
                onTap: () {
                  // BlocProvider.of<AuthBloc>(context, listen: false)
                  //     .add(LogingIn());
                  Navigator.of(context).pushNamed(LoginPage.routeName);
                },
              ),
              const Spacer(
                flex: 1,
              ),
              SpringButton(
                SpringButtonType.OnlyScale,
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 2,
                      color: Colors.white,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: const Center(
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                scaleCoefficient: 0.9,
                useCache: false,
                onTap: () {
                  Navigator.of(context).pushNamed(UserRegistration.routeName);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Forgot password?",
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.6),
                  ),
                  TextButton(
                    child: const Text(
                      "Click Here",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.yellow,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.6),
                    ),
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context, listen: false)
                          .add(ForgatPasswordIntializ());
                    },
                  ),
                ],
              ),
              const Spacer(
                flex: 1,
              ),
              const Text(
                "Hello!",
                style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.6),
              ),
              const SizedBox(
                height: 10.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
