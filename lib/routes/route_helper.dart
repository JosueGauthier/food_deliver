import 'package:food_deliver/pages/food/popularfooddetail.dart';
import 'package:food_deliver/pages/food/recommended_food_detail.dart';
import 'package:food_deliver/pages/home/main_full_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";

  static const String popularFood = "/popular-food";

  static const String recommendedFood = "/reccommended-food";

  //? formalisme pour passer des paramètres
  static String getInitial() => '$initial';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId) =>
      '$recommendedFood?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularFoodDetail(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecommendedFoodDetail(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
  ];
}
