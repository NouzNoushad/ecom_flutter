import 'package:ecommerce_flutter/config/routes/app_routes.dart';
import 'package:ecommerce_flutter/config/routes/route_constant.dart';
import 'package:ecommerce_flutter/features/authentication/presentation/cubit/cubit_widget.dart';
import 'package:flutter/material.dart';

import 'config/theme/app_theme.dart';
import 'features/authentication/presentation/screens/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitWidget(
      child: MaterialApp(
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
        initialRoute: RouteConstants.login,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
