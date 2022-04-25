import 'package:flutter/material.dart';
import 'package:miaged_mvp1/presentation/dashboard.dart';
import 'package:miaged_mvp1/presentation/main_page.dart';
import 'package:miaged_mvp1/presentation/home_page.dart';

import '../../presentation/login_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MainPage());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/homepage':
        return MaterialPageRoute(builder: (_) => const HomePageScreen());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => Dashboard());
      default:
        return null;
    }
  }
}
