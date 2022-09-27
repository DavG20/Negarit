
import 'libs.dart';
import 'package:http/http.dart' as http;

void main() {
  final AuthRepo authRepo = AuthRepo(
    authDataProvider: AuthDataProvider(httpClient: http.Client()),
  );

  runApp(Wrapper(authRepo: authRepo));
}
