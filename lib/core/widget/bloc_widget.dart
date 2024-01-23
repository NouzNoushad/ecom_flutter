import 'package:ecommerce_flutter/core/api/base_client.dart';
import 'package:ecommerce_flutter/features/authentication/data_source/remote_data_source.dart';
import 'package:ecommerce_flutter/features/bottom_nav/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:ecommerce_flutter/features/products/data_source/products_data_source.dart';
import 'package:ecommerce_flutter/features/products/presentation/products_bloc/products_bloc.dart';
import 'package:ecommerce_flutter/features/splash/splash_cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/authentication/presentation/cubit/auth_cubit/auth_cubit.dart';

class BlocWidget extends StatelessWidget {
  const BlocWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashCubit(),
        ),
        BlocProvider(
          create: (context) => BottomNavCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(
              authRemoteDataSource:
                  AuthRemoteDataSourceImpl(apiConsumer: BaseClient())),
        ),
        BlocProvider(
          create: (context) => ProductsBloc(
              productDataSource:
                  ProductDataSourceImpl(apiConsumer: BaseClient())),
        ),
      ],
      child: child,
    );
  }
}
