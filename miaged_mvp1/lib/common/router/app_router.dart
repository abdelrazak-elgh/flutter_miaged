import 'package:flutter/material.dart';
import 'package:miaged_mvp1/presentation/dashboard.dart';
import 'package:miaged_mvp1/presentation/homepage.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePageScreen());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => const Dashboard());
      default:
        return null;
    }
  }
}
