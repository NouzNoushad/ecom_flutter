import 'package:ecommerce_flutter/config/routes/route_constant.dart';
import 'package:ecommerce_flutter/features/authentication/presentation/screens/login_screen.dart';
import 'package:ecommerce_flutter/features/authentication/presentation/screens/register_screen.dart';
import 'package:ecommerce_flutter/features/bottom_nav/bottom_nav.dart';
import 'package:ecommerce_flutter/features/products/presentation/screens/product_details.dart';
import 'package:ecommerce_flutter/features/products/presentation/screens/products_screen.dart';
import 'package:ecommerce_flutter/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.splash:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.splash),
            builder: (context) => const SplashScreen());
      case RouteConstants.bottomNav:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.bottomNav),
            builder: (context) => const BottomNavScreen());
      case RouteConstants.login:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.login),
            builder: (context) => const LoginScreen());
      case RouteConstants.register:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.register),
            builder: (context) => const RegisterScreen());
      case RouteConstants.products:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.products),
            builder: (context) => const ProductsScreen());
      case RouteConstants.details:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.details),
            builder: (context) => ProductDetails(
                  productId: settings.arguments as int,
                ));
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(child: Text('Screen Not Found')),
                ));
    }
  }
}
