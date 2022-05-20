import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaged_mvp1/data/repositories/authentication_repository.dart';
import 'package:miaged_mvp1/data/repositories/database_repository.dart';
import 'package:miaged_mvp1/service/bloc/authentification/auth_bloc.dart';
import 'package:miaged_mvp1/service/bloc/observer/app_observer.dart';

import 'common/router/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //runApp(App(appRouter: AppRouter()));
  BlocOverrides.runZoned(
    () => runApp(MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthenticationRepository(),
        ),
        RepositoryProvider(
          create: (context) => DatabaseRepository(),
        ),
      ],
      child: BlocProvider(
        create: (context) => AuthBloc(
            RepositoryProvider.of<AuthenticationRepository>(context),
            RepositoryProvider.of<DatabaseRepository>(context))
          ..add(AuthInitial()),
        child: App(
          appRouter: AppRouter(),
        ),
      ),
    )),
    blocObserver: AppBlocObserver(),
  );
}

class App extends StatelessWidget {
  App({Key? key, required AppRouter appRouter}) : super(key: key);

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}
