import 'package:flutter/material.dart';
import 'package:miaged_mvp1/presentation/screens/dashboard.dart';
import 'package:miaged_mvp1/presentation/root/main_page.dart';
import 'package:miaged_mvp1/presentation/screens/signup_page.dart';

import '../../presentation/screens/signin_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MainPage());
      case '/signin':
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => Dashboard());
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
