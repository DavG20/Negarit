import 'package:negarit/libs.dart';

class WelcomeLaoder extends StatelessWidget {
  static const routeName = '/auth/splash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'Negarit Chat',
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.3),
            ),
            Text(
              "Let's Connect together!",
              style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.6),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const SpinKitFadingCircle(
              color: Colors.redAccent,
              size: 35.0,
            ),
            const Spacer(),
            Text(
              "Connecting...",
              style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.6),
            ),
            const SizedBox(
              height: 10.0,
            )
          ],
        ),
      ),
    );
  }
}
