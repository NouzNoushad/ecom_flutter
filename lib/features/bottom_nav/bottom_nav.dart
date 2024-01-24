import 'package:ecommerce_flutter/core/utils/colors.dart';
import 'package:ecommerce_flutter/features/bottom_nav/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:ecommerce_flutter/features/carts/presentation/screens/cart_screen.dart';
import 'package:ecommerce_flutter/features/products/presentation/screens/products_screen.dart';
import 'package:ecommerce_flutter/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  buildScreen(int index) {
    switch (index) {
      case 0:
        return const ProductsScreen();
      case 1:
        return const CartScreen();
      case 2:
        return const ProfileScreen();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorPicker.backgroundColor,
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.selectedIndex,
              backgroundColor: ColorPicker.primaryColor,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: ColorPicker.primaryDarkColor,
              unselectedItemColor: Colors.purple.shade300,
              onTap: (index) {
                context.read<BottomNavCubit>().onTapBottomNavItem(index);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart), label: 'cart'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'profile'),
              ]),
          body: buildScreen(state.selectedIndex),
        );
      },
    );
  }
}
