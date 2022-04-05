import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver/controllers/popular_product_controller.dart';
import 'package:food_deliver/controllers/recommended_product_controller.dart';
import 'package:food_deliver/models/Popular_product_model.dart';
import 'package:food_deliver/routes/route_helper.dart';
import 'package:food_deliver/utils/app_constats.dart';
import 'package:food_deliver/utils/colors.dart';
import 'package:food_deliver/utils/dimensions.dart';
import 'package:food_deliver/widget/app_icon.dart';
import 'package:food_deliver/widget/big_text.dart';
import 'package:food_deliver/widget/expandable_text_widget.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../cart/cart_page.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  final String pagefrom;

  const RecommendedFoodDetail(
      {Key? key, required this.pageId, required this.pagefrom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];

    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 80,
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          if (pagefrom == "cartpage") {
                            Get.toNamed(RouteHelper.getCartPage());
                          } else {
                            Get.toNamed(RouteHelper.getInitial());
                          }
                        },
                        child: AppIcon(iconData: Icons.close)),
                    GetBuilder<PopularProductController>(builder: (controller) {
                      return GestureDetector(
                        onTap: () {
                          if (controller.totalItems >= 1) {
                            Get.toNamed(RouteHelper.getCartPage());
                          }
                        },
                        child: Stack(
                          children: [
                            AppIcon(iconData: Icons.shopping_bag),
                            Get.find<PopularProductController>().totalItems >= 1
                                ? Positioned(
                                    right: 0,
                                    top: 0,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        AppIcon(
                                          iconData: Icons.circle,
                                          size: 20,
                                          backgroundColor: AppColors.mainColor,
                                          iconColor: Colors.transparent,
                                        ),
                                        Center(
                                            child: BigText(
                                          text: Get.find<
                                                  PopularProductController>()
                                              .totalItems
                                              .toString(),
                                          color: Colors.white,
                                          size: 12,
                                        ))
                                      ],
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      );
                    })
                  ]),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(Dimensions.height20),
                child: Container(
                  child: Center(
                      child: BigText(
                    text: product.name!,
                    size: Dimensions.height30,
                  )),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 7, bottom: 7),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.width20),
                          topRight: Radius.circular(Dimensions.width20))),
                ),
              ),
              expandedHeight: 300,
              pinned: true,
              backgroundColor: AppColors.yellowColor,
              flexibleSpace: FlexibleSpaceBar(
                //title: Text("title"),
                background: Image(
                    image: NetworkImage(AppConstats.BASE_URL +
                        AppConstats.UPLOAD_URL +
                        product.img!),
                    fit: BoxFit.cover),
              ),
            ),
            SliverToBoxAdapter(
                child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.width20, right: Dimensions.width20),
                    child: ExpandableTextWidget(text: product.description!))
              ],
            )),
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (controller) {
            return Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20 * 3.5,
                    right: Dimensions.width20 * 3.5,
                    top: Dimensions.height10,
                    bottom: Dimensions.height10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(false);
                      },
                      child: AppIcon(
                        iconData: Icons.remove,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: 30,
                      ),
                    ),
                    BigText(
                      text: "\$ ${product.price} x " +
                          controller.inCartItem.toString(),
                      color: AppColors.mainBlackColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(true);
                      },
                      child: AppIcon(
                        iconData: Icons.add,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                ),
                child: Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width10, right: Dimensions.width10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 0, right: 0),
                          padding: EdgeInsets.only(
                              top: Dimensions.height20,
                              bottom: Dimensions.height20,
                              left: Dimensions.width20,
                              right: Dimensions.width20),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 230, 228, 228),
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.favorite,
                                color: AppColors.mainColor,
                                size: 25,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.popular_addItem(product);
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                top: Dimensions.height20,
                                bottom: Dimensions.height20,
                                left: Dimensions.width20,
                                right: Dimensions.width20),
                            decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BigText(
                                  size: 22,
                                  text:
                                      "\$ ${product.price! * controller.inCartItem} | Add to cart",
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        )
                      ]),
                ),
              ),
            ]);
          },
        ));
  }
}
