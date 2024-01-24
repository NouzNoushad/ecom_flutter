import 'package:ecommerce_flutter/core/utils/endpoints.dart';
import 'package:ecommerce_flutter/core/utils/extensions.dart';
import 'package:ecommerce_flutter/features/authentication/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:ecommerce_flutter/features/authentication/presentation/widgets/custom_text_field.dart';
import 'package:ecommerce_flutter/core/utils/colors.dart';
import 'package:ecommerce_flutter/features/profile/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication/presentation/screens/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    context.read<ProfileBloc>().add(GetProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: FloatingActionButton(
          backgroundColor: ColorPicker.primaryColor,
          onPressed: () {
            context.read<AuthCubit>().logoutUser();
            context.snackBar('Successfully logged out');
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
          child: const Icon(Icons.power_settings_new),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is GetProfileState) {
              final profile = state.profileData;
              String image = profile?.image.split('/').last ?? '';
              return Center(
                child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(20),
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: ClipOval(
                          child: CircleAvatar(
                              radius: 75,
                              backgroundColor: ColorPicker.primaryColor,
                              child: profile != null
                                  ? Image.network(
                                      '${Endpoints.url}/public/images/$image',
                                      fit: BoxFit.cover,
                                    )
                                  : const Icon(Icons.person)),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFieldScreen(
                          hintText: '${profile?.username}',
                          controller: nameController),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFieldScreen(
                          hintText: '${profile?.email}',
                          controller: emailController),
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
                                'Update'.toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ))),
                    ]),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
