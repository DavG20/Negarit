import 'package:negarit/libs.dart';

class Wrapper extends StatelessWidget {
  final AuthRepo authRepo;

  const Wrapper({required this.authRepo}) : assert(authRepo != null);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: this.authRepo,
      child: BlocProvider(
        create: (context) => AuthBloc(authRepo: authRepo)..add(Loading()),
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: MaterialApp(
            title: "Nagarit Chat App",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            onGenerateRoute: AppRoute.generatRoute,
          ),
        ),
      ),
    );
  }
}
