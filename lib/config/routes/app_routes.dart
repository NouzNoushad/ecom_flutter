import 'package:ecommerce_flutter/config/routes/route_constant.dart';
import 'package:ecommerce_flutter/features/authentication/presentation/screens/login_screen.dart';
import 'package:ecommerce_flutter/features/authentication/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.login:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.login),
            builder: (context) => const LoginScreen());
      case RouteConstants.register:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.register),
            builder: (context) => const RegisterScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(child: Text('Screen Not Found')),
                ));
    }
  }
}
