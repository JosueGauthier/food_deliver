import 'package:food_deliver/controllers/popular_product_controller.dart';
import 'package:food_deliver/data/api/api_client.dart';
import 'package:food_deliver/data/repository/popular_product_repo.dart';
import 'package:food_deliver/utils/app_constats.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //! api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstats.BASE_URL));

  //! repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //!controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
