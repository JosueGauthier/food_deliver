import 'package:food_deliver/controllers/cart_controller.dart';
import 'package:food_deliver/controllers/popular_product_controller.dart';
import 'package:food_deliver/data/api/api_client.dart';
import 'package:food_deliver/data/repository/cart_repo.dart';
import 'package:food_deliver/data/repository/popular_product_repo.dart';
import 'package:food_deliver/utils/app_constats.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/recommended_product_controller.dart';
import '../data/repository/recommended_repo.dart';

Future<void> init() async {
  //! load shared_preferencies

  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  //! api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstats.BASE_URL));

  //! repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  //!controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
