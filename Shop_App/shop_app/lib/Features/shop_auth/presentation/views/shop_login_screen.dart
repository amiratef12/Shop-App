import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Features/shop_auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:shop_app/Features/shop_auth/presentation/views/widgets/shop_login_screen_body.dart';

class ShopLoginScreen extends StatelessWidget {
  const ShopLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child: const Scaffold(
        body: ShopLoginScreenBody(),
      ),
    );
  }
}
