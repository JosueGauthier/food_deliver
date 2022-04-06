import 'package:flutter/material.dart';
import 'package:food_deliver/controllers/cart_controller.dart';
import 'package:food_deliver/controllers/popular_product_controller.dart';
import 'package:food_deliver/controllers/recommended_product_controller.dart';
import 'package:food_deliver/pages/home/main_full_page.dart';
import 'package:food_deliver/utils/colors.dart';
import 'package:food_deliver/utils/dimensions.dart';
import 'package:food_deliver/widget/app_icon.dart';
import 'package:food_deliver/widget/big_text.dart';
import 'package:food_deliver/widget/small_text.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';
import '../../utils/app_constats.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Positioned(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height20 * 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIcon(
                      iconData: Icons.arrow_back,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      size: Dimensions.height45,
                    ),
                    SizedBox(
                      width: Dimensions.width45 * 1.3,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getInitial());
                      },
                      child: AppIcon(
                        iconData: Icons.home,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        size: Dimensions.height45,
                      ),
                    ),
                    AppIcon(
                      iconData: Icons.shopping_bag,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      size: Dimensions.height45,
                    ),
                  ],
                )),
            Positioned(
                top: Dimensions.height45 * 3,
                right: Dimensions.width20,
                left: Dimensions.width20,
                bottom: 0,
                child: Container(
                  //color: Colors.amber,
                  child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: GetBuilder<CartController>(
                        builder: (cartController) {
                          var _cartList = cartController.getItems;
                          return ListView.builder(
                              itemCount: _cartList.length,
                              itemBuilder: ((context, index) {
                                return Container(
                                  width: double.maxFinite,
                                  height: Dimensions.height20 * 7,
                                  //color: Colors.greenAccent,
                                  margin: EdgeInsets.only(
                                      bottom: Dimensions.height20),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          int popularIndex = Get.find<
                                                  PopularProductController>()
                                              .popularProductList
                                              .indexOf(
                                                  _cartList[index].aProduct);

                                          print(popularIndex);
                                          if (popularIndex >= 0) {
                                            Get.toNamed(
                                                RouteHelper.getPopularFood(
                                                    popularIndex, "cartpage"));
                                          } else {
                                            int recommendedIndex = Get.find<
                                                    RecommendedProductController>()
                                                .recommendedProductList
                                                .indexOf(
                                                    _cartList[index].aProduct);

                                            Get.toNamed(
                                                RouteHelper.getRecommendedFood(
                                                    recommendedIndex,
                                                    "cartpage"));
                                          }
                                        },
                                        child: Container(
                                          width: Dimensions.width20 * 5,
                                          height: Dimensions.width20 * 5,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      AppConstats.BASE_URL +
                                                          AppConstats
                                                              .UPLOAD_URL +
                                                          cartController
                                                              .getItems[index]
                                                              .img!)),
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius20)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Dimensions.width10,
                                      ),
                                      //? an expanded widget take all space of the parent
                                      Expanded(
                                          child: Container(
                                        //color: Colors.redAccent,
                                        height: double.maxFinite,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              BigText(
                                                text: _cartList[index].name!,
                                                color: AppColors.mainBlackColor,
                                                size: Dimensions.height30,
                                              ),
                                              SmallText(text: "Spicy"),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  BigText(
                                                    text: _cartList[index]
                                                        .price
                                                        .toString(),
                                                    color: AppColors.mainColor,
                                                    size: Dimensions.height30,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        top:
                                                            Dimensions.height20,
                                                        bottom:
                                                            Dimensions.height20,
                                                        left:
                                                            Dimensions.width20,
                                                        right:
                                                            Dimensions.width20),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                Dimensions
                                                                    .radius20)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            cartController.addItem(
                                                                _cartList[index]
                                                                    .aProduct!,
                                                                -1);
                                                          },
                                                          child: Icon(
                                                            Icons.remove,
                                                            color: AppColors
                                                                .signColor,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: Dimensions
                                                              .width10,
                                                        ),
                                                        BigText(
                                                            size: Dimensions
                                                                .height25,
                                                            text: _cartList[
                                                                    index]
                                                                .quantity
                                                                .toString()),
                                                        SizedBox(
                                                          width: Dimensions
                                                              .width10,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            print(
                                                                "beeing tapped");
                                                            cartController.addItem(
                                                                _cartList[index]
                                                                    .aProduct!,
                                                                1);
                                                          },
                                                          child: Icon(
                                                            Icons.add,
                                                            color: AppColors
                                                                .signColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ]),
                                      )),
                                    ],
                                  ),
                                );
                              }));
                        },
                      )),
                ))
          ],
        ),
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (cartcontroller) {
            return Container(
              height: Dimensions.bottomheightbar,
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 221, 220, 217),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2),
                  )),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height20,
                          bottom: Dimensions.height20,
                          left: Dimensions.width20,
                          right: Dimensions.width20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          BigText(
                              size: Dimensions.height25,
                              text: "Total : " +
                                  cartcontroller.totalAmount.toString() +
                                  " \$"),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //popularProductController.popular_addItem(product);
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
                              size: Dimensions.height25,
                              text: "Check out",
                              //"\$ ${product.price! * popularProductController.inCartItem} | Add to cart",
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),
            );
          },
        ));
  }
}
