import 'package:negarit/libs.dart';

class AppRoute {
  static Route generatRoute(RouteSettings routeSettings) {
    if (routeSettings.name == "/") {
      MaterialPageRoute(builder: (context) =>  AuthRoutes());
    }
    if (routeSettings.name == HomePage.routeName) {
      return MaterialPageRoute(builder: ((context) => HomePage()));
    }
    if (routeSettings.name == UserRegistration.routeName) {
      return MaterialPageRoute(builder: (context) => UserRegistration());
    } else {
      return MaterialPageRoute(builder: ((context) => HomePage()));
    }
  }
}
