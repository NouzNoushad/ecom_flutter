import 'package:ecommerce_flutter/features/authentication/presentation/screens/register_screen.dart';
import 'package:ecommerce_flutter/features/authentication/presentation/widgets/custom_text_field.dart';
import 'package:ecommerce_flutter/core/utils/colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.backgroundColor,
      body: SafeArea(
        child: Center(
          child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              children: [
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldScreen(
                    hintText: 'email', controller: nameController),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFieldScreen(
                    hintText: 'password', controller: nameController),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const RegisterScreen()));
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
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorPicker.primaryColor,
                        ),
                        child: Text(
                          'Login'.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        )))
              ]),
        ),
      ),
    );
  }
}
