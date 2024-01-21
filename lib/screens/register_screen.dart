import 'package:ecommerce_flutter/screens/login_screen.dart';
import 'package:ecommerce_flutter/screens/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.purple,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 100,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFieldScreen(
                    hintText: 'username', controller: nameController),
                const SizedBox(
                  height: 8,
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
                            builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        'Already have an account? Login',
                        style: TextStyle(color: Colors.purple),
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
                          backgroundColor: Colors.purple,
                        ),
                        child: Text(
                          'Register'.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        )))
              ]),
        ),
      ),
    );
  }
}
