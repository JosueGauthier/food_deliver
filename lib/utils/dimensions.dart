import 'package:get/get.dart';

class Dimensions {
  // To obtain height of my device :
  // main_full_page

  //print("height" + MediaQuery.of(context).size.height.toString());

  static double screenWidth = Get.context!.width;
  static double screenHeight = Get.context!.height;

  static double pageViewContainer = screenHeight / 3.84;

  static double pageViewheight = screenHeight / 2.64;

  //
  // 844/140
  static double pageViewText = screenHeight / 6.02;

  static double height10 = screenHeight / 84.4;
  static double height20 = screenHeight / 42.2;
  static double height12 = screenHeight / 70;
  static double height15 = screenHeight / 56.26;
  static double height45 = screenHeight / 18.75;
  static double height1dot2 = screenHeight / 703.33;

  static double width10 = screenWidth / 41;
  static double width20 = screenWidth / 20.55;
  static double width15 = screenWidth / 27.4;
  static double width25 = screenWidth / 16.44;
  static double width45 = screenWidth / 9.13;
  static double width5 = screenWidth / 82.2;

  static double fontheight20 = screenHeight / 42.2;

  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.1;
}
