import 'package:ecommerce_flutter/core/utils/extensions.dart';
import 'package:ecommerce_flutter/features/authentication/models/user_model.dart';
import 'package:ecommerce_flutter/features/authentication/presentation/cubit/register_cubit/register_cubit.dart';
import 'package:ecommerce_flutter/features/authentication/presentation/screens/login_screen.dart';
import 'package:ecommerce_flutter/features/authentication/presentation/widgets/custom_text_field.dart';
import 'package:ecommerce_flutter/core/utils/colors.dart';
import 'package:ecommerce_flutter/features/authentication/presentation/widgets/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

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
                Center(
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 75,
                        backgroundColor: ColorPicker.primaryColor,
                        child: Icon(
                          Icons.person,
                          color: ColorPicker.whiteColor,
                          size: 100,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) => Container(
                                      height: context.height * 0.2,
                                      padding: const EdgeInsets.all(20),
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ImagePickerContainer(
                                              onTap: () {
                                                context
                                                    .read<RegisterCubit>()
                                                    .pickImage(
                                                        ImageSource.camera);
                                              },
                                              icon: Icons.camera,
                                              text: "Camera"),
                                          ImagePickerContainer(
                                              onTap: () {
                                                context
                                                    .read<RegisterCubit>()
                                                    .pickImage(
                                                        ImageSource.gallery);
                                              },
                                              icon: Icons.image,
                                              text: "Gallery"),
                                        ],
                                      ),
                                    ));
                          },
                          child: const CircleAvatar(
                              radius: 20,
                              backgroundColor: Color.fromARGB(255, 81, 0, 95),
                              child: Icon(
                                Icons.add,
                                color: ColorPicker.whiteColor,
                              )),
                        ),
                      )
                    ],
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
                        style: TextStyle(color: ColorPicker.primaryColor),
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          context.read<RegisterCubit>().registerUser(
                              nameController.text.trim(),
                              emailController.text.trim(),
                              passwordController.text.trim());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorPicker.primaryColor,
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
