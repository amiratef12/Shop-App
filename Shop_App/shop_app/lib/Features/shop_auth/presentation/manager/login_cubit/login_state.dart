import 'package:shop_app/Features/shop_auth/data/models/login_model.dart';

abstract class ShopLoginStates {}

class ShopLoginInitialState extends ShopLoginStates {}

class ShopLoginLoadingState extends ShopLoginStates {}

class ShopLoginSuccessState extends ShopLoginStates {
  ShopLoginModel loginModel;
  ShopLoginSuccessState(this.loginModel);
}

class ShopLoginFailureState extends ShopLoginStates {
  final String errMessage;

  ShopLoginFailureState(this.errMessage);
}

class ShopChangePasswordVisibilityState extends ShopLoginStates {}
