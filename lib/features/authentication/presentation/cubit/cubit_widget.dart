import 'package:ecommerce_flutter/core/api/base_client.dart';
import 'package:ecommerce_flutter/features/authentication/data/data_source/remote_data_source.dart';
import 'package:ecommerce_flutter/features/authentication/presentation/cubit/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitWidget extends StatelessWidget {
  const CubitWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(
        authRemoteDataSource: AuthRemoteDataSourceImpl(apiConsumer: BaseClient())
      ),
      child: child,
    );
  }
}
