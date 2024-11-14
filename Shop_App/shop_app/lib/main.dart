import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:shop_app/Features/shop_auth/presentation/views/shop_login_screen.dart';
import 'package:shop_app/Features/shop_layout/presentation/manger/shop_cubit/shop_cubit.dart';
import 'package:shop_app/Features/shop_layout/presentation/views/shop_layout.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/core/utils/cache_helper.dart';
import 'package:shop_app/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Widget widget;
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  if (onBoarding != null) {
    if (token != null) {
      widget = const ShopLayout();
    } else {
      widget = const ShopLoginScreen();
    }
  } else {
    widget = const OnBoardingView();
  }

  runApp(ShopApp(
    startWidget: widget,
  ));
  Bloc.observer = MyBlocObserver();
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key, required this.startWidget});
  final Widget startWidget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit()
        ..getHomeData()
        ..getShopCategoriesData()
        ..getFavoritesData()
        ..getUserData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        home: startWidget,
      ),
    );
  }
}
