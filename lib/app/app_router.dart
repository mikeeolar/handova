import 'package:flutter/material.dart';
import 'package:handova/app/routes.dart';
import 'package:handova/ui/views/auth/login_screen.dart';
import 'package:handova/ui/views/auth/map_screen.dart';
import 'package:handova/ui/views/auth/orders_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.mapScreen:
        return MaterialPageRoute(builder: (_) => MapScreen());
      case Routes.ordersSreen:
        return MaterialPageRoute(builder: (_) => const OrdersSreen());
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
