import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Features/shop_auth/data/models/login_model.dart';
import 'package:shop_app/Features/shop_layout/data/models/categories_model.dart';
import 'package:shop_app/Features/shop_layout/data/models/change_favorites_model.dart';
import 'package:shop_app/Features/shop_layout/data/models/get_favorites_model.dart';
import 'package:shop_app/Features/shop_layout/data/models/shop_model.dart';
import 'package:shop_app/Features/shop_layout/data/models/update_model.dart';
import 'package:shop_app/Features/shop_layout/presentation/manger/shop_cubit/shop_states.dart';
import 'package:shop_app/Features/shop_layout/presentation/views/widgets/categories_screen.dart';
import 'package:shop_app/Features/shop_layout/presentation/views/widgets/favorites_screen.dart';
import 'package:shop_app/Features/shop_layout/presentation/views/widgets/products_screen.dart';
import 'package:shop_app/Features/shop_layout/presentation/views/widgets/setteings_screen.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/core/utils/api_service.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialStates());
  int currentIndex = 0;
  List<Widget> bottomScreens = const [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SetteingsScreen()
  ];
  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

  HomeModel? homeModel;
  Map<int, bool> favorites = {};
  void getHomeData() {
    ApiService(Dio()).get(endPoint: kHOME, token: token).then((value) {
      emit(ShopSuccessHomeDataState());
      // print('token is : $token');
      // printFullText(value.data.toString());
      homeModel = HomeModel.fromJson(value.data);
      homeModel?.data.products.forEach((element) {
        favorites.addAll({element.id: element.inFavorites});
      });
      // print(favorites);
    }).catchError((error) {
      // print(error.toString());
      emit(ShopFailureHomeDataState(errMessage: error.toString()));
    });
  }

  CategoriesModel? categoriesModel;
  void getShopCategoriesData() {
    ApiService(Dio()).get(endPoint: kCategories).then((value) {
      emit(ShopSuccessCategoriesState());
      categoriesModel = CategoriesModel.fromJson(value.data);
    }).catchError((error) {
      // print(error.toString());
      emit(ShopFailureCategoriesState(errMessage: error.toString()));
    });
  }

  ChangeFavoritesModel? changeFavoritesModel;
  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId]!;
    emit(ShopChangeFavoritesState());
    ApiService(Dio())
        .post(
            endPoint: kFavorites, body: {"product_id": productId}, token: token)
        .then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      if (!changeFavoritesModel!.status) {
        favorites[productId] = !favorites[productId]!;
      } else {
        getFavoritesData();
      }
      // print(changeFavoritesModel?.message);
      // print(changeFavoritesModel?.status);
      emit(ShopSuccessChangeFavoritesState(changeFavoritesModel!));
    }).catchError((error) {
      favorites[productId] = !favorites[productId]!;
      emit(ShopFailureChangeFavoritesState(errMessage: error.toString()));
    });
  }

  GetFavoritesModel? getFavoritesModel;
  void getFavoritesData() {
    ApiService(Dio()).get(endPoint: kFavorites, token: token).then((value) {
      getFavoritesModel = GetFavoritesModel.fromJson(value.data);

      emit(ShopSuccessGetFavoriteState());
    }).catchError((error) {
      // print(error.toString());
      emit(ShopFailureGetFavoriteState(errMessage: error.toString()));
    });
  }

  ShopLoginModel? userModel;
  void getUserData() {
    ApiService(Dio()).get(endPoint: kProfile, token: token).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);

      emit(ShopSuccessUserDataState());
    }).catchError((error) {
      // print(error.toString());
      emit(ShopFailureUserDataState(errMessage: error.toString()));
    });
  }

  ShopUpdateModel? updateModel;
  void updateUserData(
      {required String name, required String email, required String phone}) {
    emit(ShopLoadingUpdateUserState());
    ApiService(Dio())
        .put(
            endPoint: kUpdateProfile,
            body: {'name': name, 'email': email, 'phone': phone},
            token: token)
        .then((value) {
      updateModel = ShopUpdateModel.fromJson(value.data);
      // print('token update is : ${updateModel!.data?.token}');

      emit(ShopSuccessUpdateUserState());
      getUserData();
    }).catchError((error) {
      // print(error.toString());
      emit(ShopFailureUpdateUserState(errMessage: error.toString()));
    });
  }
}
