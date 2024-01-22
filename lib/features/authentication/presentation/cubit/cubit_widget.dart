import 'package:ecommerce_flutter/core/api/base_client.dart';
import 'package:ecommerce_flutter/features/authentication/data_source/remote_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_cubit/auth_cubit.dart';

class CubitWidget extends StatelessWidget {
  const CubitWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
              authRemoteDataSource:
                  AuthRemoteDataSourceImpl(apiConsumer: BaseClient())),
        ),
      ],
      child: child,
    );
  }
}
