import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver/utils/colors.dart';
import 'package:food_deliver/utils/dimensions.dart';
import 'package:food_deliver/widget/big_text.dart';
import 'package:food_deliver/widget/icon_and_text.dart';
import 'package:food_deliver/widget/small_text.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //! sliderSection
        Container(
          //color: Colors.blue,
          height: Dimensions.pageViewheight,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),

        //Dots section
        DotsIndicator(
          dotsCount: 5,
          position: _currentPagevalue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            color: AppColors.textColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),

        //!Popular items
        SizedBox(
          height: Dimensions.height20,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            BigText(text: "Popular"),
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

        Container(
          height: 700,
          child: ListView.builder(
              //shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      bottom: Dimensions.height15),
                  child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //! image section
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/image/food0.png")),
                              borderRadius:
                                  BorderRadius.circular(Dimensions.width20)),
                        ),

                        //! text section

                        //? expanded widget force container to take all the available space
                        Expanded(
                          child: Container(
                            height: 100,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.only(
                                    topRight:
                                        Radius.circular(Dimensions.height20),
                                    bottomRight:
                                        Radius.circular(Dimensions.height20))),
                          ),
                        )
                      ]),
                );
              }),
        ),
      ],
    );
  }

  Widget _buildPageItem(int position) {
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

    //? mise en place d'un stack container pour que la hauteur désiree soit 220 et non 320.
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: _height,
            margin: EdgeInsets.only(
                left: Dimensions.width5, right: Dimensions.width5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                //color: position.isEven ? Colors.red : Colors.amber,
                image: DecorationImage(
                    image: AssetImage("assets/image/food2.jpg"),
                    fit: BoxFit.cover)),
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
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: "Chinese Pho"),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                                5,
                                (index) => Icon(
                                      Icons.star,
                                      color: AppColors.mainColor,
                                      size: 15,
                                    )),
                          ),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          SmallText(text: "4.5"),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          SmallText(text: "1287"),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          SmallText(text: "comments"),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconAndTextWidget(
                              icon: Icons.circle,
                              text: "Normal",
                              iconcolor: Colors.amber),
                          SizedBox(
                            width: Dimensions.width20,
                          ),
                          IconAndTextWidget(
                              icon: Icons.location_pin,
                              text: "1.7 km",
                              iconcolor: AppColors.mainColor),
                          SizedBox(
                            width: Dimensions.width20,
                          ),
                          IconAndTextWidget(
                              icon: Icons.lock_clock,
                              text: "16 min",
                              iconcolor: Colors.pink),
                        ],
                      )
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
