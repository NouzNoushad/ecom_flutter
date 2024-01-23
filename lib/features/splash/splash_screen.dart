import 'package:ecommerce_flutter/core/utils/colors.dart';
import 'package:ecommerce_flutter/features/splash/splash_cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<SplashCubit>().checkRoute(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorPicker.primaryDarkColor,
      body: Center(
          child: Text(
        'Ecom App',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w500,
          color: ColorPicker.whiteColor,
        ),
      )),
    );
  }
}
