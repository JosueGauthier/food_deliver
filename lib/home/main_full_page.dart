import 'package:flutter/material.dart';
import 'package:food_deliver/home/food_page_body.dart';
import 'package:food_deliver/utils/colors.dart';
import 'package:food_deliver/widget/big_text.dart';
import 'package:food_deliver/widget/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    //print("height" + MediaQuery.of(context).size.height.toString());
    //print("width" + MediaQuery.of(context).size.width.toString());
    return Scaffold(
        body: Column(
      children: [
        //! Showing the header
        Container(
          margin: EdgeInsets.only(top: 45, bottom: 15),
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "France",
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(text: "Lyon"),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.mainColor),
                    ),
                  )
                ]),
          ),
        ),

        //! Showing the body
        FoodPageBody(),
      ],
    ));
  }
}
