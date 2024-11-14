import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/Features/shop_auth/data/models/register_model.dart';
import 'package:shop_app/Features/shop_auth/presentation/manager/register_cubit/register_state.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/core/utils/api_service.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates> {
  ShopRegisterCubit() : super(ShopRegisterInitialState());
  ShopRegisterModel? registerModel;
  void userRegister(
      {required String name,
      required String phone,
      required String email,
      required String password}) {
    emit(ShopRegisterLoadingState());
    ApiService(Dio()).post(endPoint: kRegister, body: {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password
    }).then((value) {
      registerModel = ShopRegisterModel.fromJson(value.data);
      emit(ShopRegisterSuccessState(registerModel!));
    }).catchError((error) {
      emit(ShopRegisterFailureState(error.toString()));
      // print(error.toString());
    });
  }

  IconData suffixIcon = Icons.visibility_off_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffixIcon =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ShopRegisterChangePasswordVisibilityState());
  }
}
