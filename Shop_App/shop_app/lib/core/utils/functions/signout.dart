import 'package:shop_app/Features/shop_auth/presentation/views/shop_login_screen.dart';
import 'package:shop_app/core/utils/cache_helper.dart';
import 'package:shop_app/core/utils/functions/navigate_to.dart';

void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    navigateTo(context, const ShopLoginScreen());
  });
}
