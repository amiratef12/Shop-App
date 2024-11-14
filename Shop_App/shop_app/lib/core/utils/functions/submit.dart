import 'package:shop_app/Features/shop_auth/presentation/views/shop_login_screen.dart';
import 'package:shop_app/core/utils/cache_helper.dart';
import 'package:shop_app/core/utils/functions/navigate_to.dart';

submit(context) {
  CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
    if (value!) {
      navigateTo(context, const ShopLoginScreen());
    }
  });
}
