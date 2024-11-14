import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Features/shop_auth/data/models/login_model.dart';
import 'package:shop_app/Features/shop_auth/presentation/manager/login_cubit/login_state.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/core/utils/api_service.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());
  ShopLoginModel? loginModel;
  void userLogin({required String email, required String password}) {
    emit(ShopLoginLoadingState());
    ApiService(Dio()).post(
        endPoint: kLOGIN,
        body: {'email': email, 'password': password}).then((value) {
      loginModel = ShopLoginModel.fromJson(value.data);
      emit(ShopLoginSuccessState(loginModel!));
    }).catchError((error) {
      emit(ShopLoginFailureState(error.toString()));
      // print(error.toString());
    });
  }

  IconData suffixIcon = Icons.visibility_off_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffixIcon =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ShopChangePasswordVisibilityState());
  }
}
