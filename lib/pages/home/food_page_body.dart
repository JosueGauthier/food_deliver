import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver/controllers/popular_product_controller.dart';
import 'package:food_deliver/controllers/recommended_product_controller.dart';
import 'package:food_deliver/models/Popular_product_model.dart';
import 'package:food_deliver/pages/food/popularfooddetail.dart';
import 'package:food_deliver/routes/route_helper.dart';
import 'package:food_deliver/utils/app_constats.dart';
import 'package:food_deliver/utils/colors.dart';
import 'package:food_deliver/utils/dimensions.dart';
import 'package:food_deliver/widget/app_column.dart';
import 'package:food_deliver/widget/big_text.dart';
import 'package:food_deliver/widget/icon_and_text.dart';
import 'package:food_deliver/widget/small_text.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.9);

  var _currentPagevalue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    pageController.addListener(() {
      setState(() {
        _currentPagevalue = pageController.page!;
        //print(_currentPagevalue.toString());
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //! sliderSection

        GetBuilder<PopularProductController>(
            builder: (popularProductsController) {
          return popularProductsController.isLoaded
              ? Container(
                  //color: Colors.blue,
                  height: Dimensions.pageViewheight,

                  child: PageView.builder(
                      controller: pageController,
                      itemCount:
                          popularProductsController.popularProductList.length,
                      itemBuilder: (context, position) {
                        return _buildPageItem(
                            position,
                            popularProductsController
                                .popularProductList[position]);
                      }),
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),

        //!Dots section
        GetBuilder<PopularProductController>(
            builder: (popularProductsController) {
          int dotsnumber = popularProductsController.popularProductList.length;

          //print(popularProductsController.popularProductList.length);
          return DotsIndicator(
            dotsCount: dotsnumber <= 0 ? 1 : dotsnumber,
            position: _currentPagevalue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              color: AppColors.textColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          );
        }),

        //!Recommended items
        SizedBox(
          height: Dimensions.height20,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            BigText(text: "Recommended"),
            SizedBox(
              width: Dimensions.width10,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 3),
              child: BigText(
                text: ".",
                color: Color.fromARGB(255, 184, 183, 179),
              ),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            Container(
              child: SmallText(
                text: "Food pairing",
                color: Color.fromARGB(255, 184, 183, 179),
              ),
            ),
          ]),
        ),
        SizedBox(
          height: Dimensions.height10,
        ),

        //! recommended food scroll view
        GetBuilder<RecommendedProductController>(
            builder: (recommendedProductController) {
          return recommendedProductController.isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: recommendedProductController
                      .recommendedProductList.length,
                  itemBuilder: (context, index) {
                    ProductModel recommendedProduct =
                        recommendedProductController
                            .recommendedProductList[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                            RouteHelper.getRecommendedFood(index, "home"));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20,
                            bottom: Dimensions.height15),
                        child: Row(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //! image section
                              Container(
                                height: Dimensions.listviewimgSize,
                                width: Dimensions.listviewimgSize,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(AppConstats.BASE_URL +
                                          AppConstats.UPLOAD_URL +
                                          recommendedProduct.img!),
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.width20)),
                              ),

                              //! text section

                              //? expanded widget force container to take all the available space
                              Expanded(
                                child: Container(
                                  height: Dimensions.listviewTextHeigth + 10,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(
                                              Dimensions.height20),
                                          bottomRight: Radius.circular(
                                              Dimensions.height20))),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: Dimensions.width10,
                                        right: Dimensions.width10),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        BigText(
                                          text: recommendedProduct.name!,
                                          size: Dimensions.height25,
                                        ),
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        SmallText(
                                            allowOverFlow: true,
                                            maxLines: 2,
                                            text: recommendedProduct
                                                .description!),
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconAndTextWidget(
                                                icon: Icons.circle,
                                                text: "Normal",
                                                iconcolor: Colors.amber),
                                            SizedBox(
                                              width: 0,
                                            ),
                                            IconAndTextWidget(
                                                icon: Icons.location_pin,
                                                text: "1.7 km",
                                                iconcolor: AppColors.mainColor),
                                            SizedBox(
                                              width: 0,
                                            ),
                                            IconAndTextWidget(
                                                icon: Icons.lock_clock,
                                                text: "16 min",
                                                iconcolor: Colors.pink),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ]),
                      ),
                    );
                  })
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        })
      ],
    );
  }

  Widget _buildPageItem(int position, ProductModel popularProduct) {
    Matrix4 matrix = new Matrix4.identity();

    if (position == _currentPagevalue.floor()) {
      var currScale = 1 - (_currentPagevalue - position) * (1 - _scaleFactor);
      var currTranslation = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTranslation, 0);
    } else if (position == _currentPagevalue.floor() + 1) {
      var currScale = _scaleFactor +
          (_currentPagevalue - position + 1) * (1 - _scaleFactor);
      var currTranslation = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTranslation, 0);
    } else if (position == _currentPagevalue.floor() - 1) {
      var currScale = 1 - (_currentPagevalue - position) * (1 - _scaleFactor);
      var currTranslation = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTranslation, 0);
    } else {
      var currScale = 0.8;
      var currTranslation = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTranslation, 0);
    }

    //? mise en place d'un stack container pour que la hauteur d??siree soit 220 et non 320.
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getPopularFood(position, "home"));
            },
            child: Container(
              height: _height,
              margin: EdgeInsets.only(
                  left: Dimensions.width5, right: Dimensions.width5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  //color: position.isEven ? Colors.red : Colors.amber,
                  image: DecorationImage(
                      image: NetworkImage(AppConstats.BASE_URL +
                          AppConstats.UPLOAD_URL +
                          popularProduct.img!),
                      fit: BoxFit.cover)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewText,
              margin: EdgeInsets.only(
                  left: Dimensions.width25,
                  right: Dimensions.width25,
                  bottom: Dimensions.height20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 221, 216, 216),
                        blurRadius: 10,
                        offset: Offset(2, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                  ]),
              child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height10,
                      left: Dimensions.width15,
                      right: Dimensions.width15),
                  child: AppColumn(titletext: popularProduct.name!)),
            ),
          ),
        ],
      ),
    );
  }
}
