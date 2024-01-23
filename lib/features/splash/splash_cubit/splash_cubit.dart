import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter/config/routes/route_constant.dart';
import 'package:ecommerce_flutter/core/utils/strings.dart';
import 'package:ecommerce_flutter/features/products/presentation/screens/products_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());

  checkRoute(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppStrings.token) ?? "";
    Future.delayed(const Duration(seconds: 2), () {
      if (token != "") {
        Navigator.of(context).pushReplacementNamed(RouteConstants.bottomNav);
      } else {
        Navigator.of(context).pushReplacementNamed(RouteConstants.login);
      }
    });
  }
}
