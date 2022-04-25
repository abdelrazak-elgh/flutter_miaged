import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaged_mvp1/data/repositories/auth_repository.dart';
import 'package:miaged_mvp1/service/bloc/authentification/auth_bloc.dart';
import 'package:miaged_mvp1/service/bloc/observer/app_observer.dart';

import 'common/app.dart';
import 'common/router/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //runApp(App(appRouter: AppRouter()));
  BlocOverrides.runZoned(
    () => runApp(RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
            authRepository: RepositoryProvider.of<AuthRepository>(context))
          ..add(AuthInitial()),
        child: App(
          appRouter: AppRouter(),
        ),
      ),
    )),
    blocObserver: AppBlocObserver(),
  );
}
