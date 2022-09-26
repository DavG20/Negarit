import 'package:negarit/libs.dart';

class UserRegistration extends StatelessWidget {
 

  static const routeName = "auth/userregister";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration Page"),
      ),
      body: Center(child: Text("welocme")),
    );
  }
}
