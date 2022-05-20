import 'package:flutter/material.dart';
import 'package:miaged_mvp1/presentation/screens/home_view.dart';
import 'package:miaged_mvp1/presentation/root/initial_navigation_view.dart';
import 'package:miaged_mvp1/presentation/screens/signup_view.dart';

import '../../presentation/screens/signin_view.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const InitialNavigationView());
      case '/signin':
        return MaterialPageRoute(builder: (_) => const SignInView());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child:
                          Text('No route defined for ${routeSettings.name}')),
                ));
    }
  }
}
