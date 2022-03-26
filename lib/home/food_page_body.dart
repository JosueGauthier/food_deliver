import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver/utils/colors.dart';
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
  double _height = 220;

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
        Container(
          //color: Colors.blue,
          height: 320,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: _currentPagevalue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            color: AppColors.textColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
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
            margin: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                //color: position.isEven ? Colors.red : Colors.amber,
                image: DecorationImage(
                    image: AssetImage("assets/image/food2.jpg"),
                    fit: BoxFit.cover)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 140,
              margin: EdgeInsets.only(left: 25, right: 25, bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
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
                padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: "Chinese Pho"),
                      SizedBox(
                        height: 10,
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
                            width: 10,
                          ),
                          SmallText(text: "4.5"),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(text: "1287"),
                          SizedBox(
                            width: 10,
                          ),
                          SmallText(text: "comments"),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          IconAndTextWidget(
                              icon: Icons.circle,
                              text: "Normal",
                              iconcolor: Colors.amber),
                          SizedBox(
                            width: 20,
                          ),
                          IconAndTextWidget(
                              icon: Icons.location_pin,
                              text: "1.7 km",
                              iconcolor: AppColors.mainColor),
                          SizedBox(
                            width: 20,
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
