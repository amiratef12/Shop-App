import 'package:shop_app/Features/shop_layout/data/models/change_favorites_model.dart';

abstract class ShopStates {}

class ShopInitialStates extends ShopStates {}

class ChangeBottomNavBarState extends ShopStates {}

class ShopSuccessHomeDataState extends ShopStates {}

class ShopFailureHomeDataState extends ShopStates {
  final String errMessage;

  ShopFailureHomeDataState({required this.errMessage});
}

class ShopSuccessCategoriesState extends ShopStates {}

class ShopFailureCategoriesState extends ShopStates {
  final String errMessage;

  ShopFailureCategoriesState({required this.errMessage});
}

class ShopChangeFavoritesState extends ShopStates {}

class ShopSuccessChangeFavoritesState extends ShopStates {
  final ChangeFavoritesModel model;

  ShopSuccessChangeFavoritesState(this.model);
}

class ShopFailureChangeFavoritesState extends ShopStates {
  final String errMessage;

  ShopFailureChangeFavoritesState({required this.errMessage});
}

class ShopSuccessGetFavoriteState extends ShopStates {}

class ShopFailureGetFavoriteState extends ShopStates {
  final String errMessage;

  ShopFailureGetFavoriteState({required this.errMessage});
}

class ShopSuccessUserDataState extends ShopStates {}

class ShopFailureUserDataState extends ShopStates {
  final String errMessage;

  ShopFailureUserDataState({required this.errMessage});
}

class ShopLoadingUpdateUserState extends ShopStates {}

class ShopSuccessUpdateUserState extends ShopStates {}

class ShopFailureUpdateUserState extends ShopStates {
  final String errMessage;

  ShopFailureUpdateUserState({required this.errMessage});
}
