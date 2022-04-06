import 'package:flutter/material.dart';
import 'package:food_deliver/controllers/popular_product_controller.dart';
import 'package:food_deliver/controllers/recommended_product_controller.dart';
import 'package:food_deliver/pages/cart/cart_page.dart';
import 'package:food_deliver/pages/food/popularfooddetail.dart';
import 'package:food_deliver/pages/food/recommended_food_detail.dart';
import 'package:food_deliver/pages/home/food_page_body.dart';
import 'package:food_deliver/pages/home/main_full_page.dart';
import 'package:food_deliver/routes/route_helper.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecomendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: RouteHelper.getInitial(),
      getPages: RouteHelper.routes,
    );
  }
}
