import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Features/shop_auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:shop_app/Features/shop_auth/presentation/views/widgets/shop_register_screen_body.dart';

class ShopRegisterScreen extends StatelessWidget {
  const ShopRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopRegisterCubit(),
      child: const Scaffold(
        body: ShopRegisterScreenBody(),
      ),
    );
  }
}
