import 'package:flutter/material.dart';
import 'package:food_deliver/pages/home/main_full_page.dart';
import 'package:food_deliver/utils/dimensions.dart';
import 'package:food_deliver/widget/app_column.dart';
import 'package:food_deliver/widget/app_icon.dart';
import 'package:food_deliver/widget/expandable_text_widget.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product_controller.dart';
import '../../models/Popular_product_model.dart';
import '../../utils/colors.dart';
import '../../widget/big_text.dart';
import '../../widget/icon_and_text.dart';
import '../../widget/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
  PopularFoodDetail({Key? key, required this.pageId}) : super(key: key) {}

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        Get.find<PopularProductController>().popularProductList[pageId];

    //print("pageid is " + pageId.toString());

    //print("productname is " + product.name.toString());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        //!background image
        Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/image/food0.png"))),
            )),

        //! icon widget
        Positioned(
          top: Dimensions.height45,
          left: Dimensions.width20,
          right: Dimensions.width20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    Get.to(() => MainFoodPage());
                  },
                  child: AppIcon(iconData: Icons.arrow_back)),
              AppIcon(iconData: Icons.shopping_bag)
            ],
          ),
        ),

        //!introduction of food
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize - 30,
            child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20)),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                      titletext: product.name!,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(text: "Introduce"),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableTextWidget(
                            text:
                                "La nébuleuse de Gum (ou Gum 12) est une énorme nébuleuse diffuse, la plus importante vue de la Terre même si elle est difficile à distinguer sans appareillagespécifique. C'est le douzième objet céleste décrit dans le catalogue de Colin Stanley Gum. Elle est située dans les Voiles de l'ancienne constellation du Navire Argo, une constellation visible principalement dans l'hémisphère sud.Son centre est situé à environ 450 parsecs du Système solaire, soit d'environ 1 470 années-lumière.  La nébuleuse de Gum est une rémanence, probablement toujours en expansion, d'une ou plusieurs  supernovas, survenues il y a quelques millions d'années.La nébuleuse de Gum (ou Gum 12) est une énorme nébuleuse diffuse, la plus importante vue de la Terre même si elle est difficile à distinguer sans appareillagespécifique. C'est le douzième objet céleste décrit dans le catalogue de Colin Stanley Gum. Elle est située dans les Voiles de l'ancienne constellation du Navire Argo, une constellation visible principalement dans l'hémisphère sud.Son centre est situé à environ 450 parsecs du Système solaire, soit d'environ 1 470 années-lumière.  La nébuleuse de Gum est une rémanence, probablement toujours en expansion, d'une ou plusieurs  supernovas, survenues il y a quelques millions d'années."),
                      ),
                    )
                  ],
                ))),

        //!Expandable text widget
      ]),
      bottomNavigationBar: Container(
        height: Dimensions.bottomheightbar,
        padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            left: Dimensions.width20,
            right: Dimensions.width20),
        decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20 * 2),
              topRight: Radius.circular(Dimensions.radius20 * 2),
            )),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.remove,
                  color: AppColors.signColor,
                ),
                SizedBox(
                  width: Dimensions.width10 / 2,
                ),
                BigText(text: "0"),
                SizedBox(
                  width: Dimensions.width10 / 2,
                ),
                Icon(
                  Icons.add,
                  color: AppColors.signColor,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(Dimensions.radius20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigText(
                  text: "\$ 10 Add to cart",
                  color: Colors.white,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
