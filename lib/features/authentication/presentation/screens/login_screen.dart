import 'package:ecommerce_flutter/core/utils/extensions.dart';
import 'package:ecommerce_flutter/features/authentication/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:ecommerce_flutter/features/authentication/presentation/screens/register_screen.dart';
import 'package:ecommerce_flutter/features/authentication/presentation/widgets/custom_text_field.dart';
import 'package:ecommerce_flutter/core/utils/colors.dart';
import 'package:ecommerce_flutter/features/bottom_nav/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.backgroundColor,
      body: SafeArea(
        child: Center(
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20),
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFieldScreen(
                        hintText: 'email', controller: emailController),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFieldScreen(
                        hintText: 'password', controller: passwordController),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen()));
                          },
                          child: const Text(
                            "Don't have an account? Register",
                            style: TextStyle(color: ColorPicker.primaryColor),
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () async {
                              String email = emailController.text.trim();
                              String password = passwordController.text.trim();
                              if (email != "" && password != "") {
                                bool response = await context
                                    .read<AuthCubit>()
                                    .loginUser(email, password);
                                if (response) {
                                  if (!mounted) return;
                                  context.snackBar('Successfully logged in');
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const BottomNavScreen()));
                                }
                                emailController.clear();
                                passwordController.clear();
                              } else {
                                context.snackBar('All Fields are required');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorPicker.primaryColor,
                            ),
                            child: Text(
                              'Login'.toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            )))
                  ]);
            },
          ),
        ),
      ),
    );
  }
}
