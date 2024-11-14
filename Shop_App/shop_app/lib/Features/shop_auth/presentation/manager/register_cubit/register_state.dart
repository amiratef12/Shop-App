import 'package:shop_app/Features/shop_auth/data/models/register_model.dart';

abstract class ShopRegisterStates {}

class ShopRegisterInitialState extends ShopRegisterStates {}

class ShopRegisterLoadingState extends ShopRegisterStates {}

class ShopRegisterSuccessState extends ShopRegisterStates {
  ShopRegisterModel registerModel;
  ShopRegisterSuccessState(this.registerModel);
}

class ShopRegisterFailureState extends ShopRegisterStates {
  final String errMessage;

  ShopRegisterFailureState(this.errMessage);
}

class ShopRegisterChangePasswordVisibilityState extends ShopRegisterStates {}
