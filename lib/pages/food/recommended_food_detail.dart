import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver/utils/colors.dart';
import 'package:food_deliver/utils/dimensions.dart';
import 'package:food_deliver/widget/app_icon.dart';
import 'package:food_deliver/widget/big_text.dart';
import 'package:food_deliver/widget/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(iconData: Icons.close),
                  AppIcon(iconData: Icons.shopping_bag_sharp)
                ]),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height20),
              child: Container(
                child: Center(
                    child: BigText(
                  text: "Rodomodo",
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
                  image: AssetImage("assets/image/food0.png"),
                  fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: ExpandableTextWidget(
                    text:
                        "La nébuleuse de Gum (ou Gum 12) est une énorme nébuleuse diffuse, la plus importante vue de la Terre même si elle est difficile à distinguer sans appareillagespécifique. C'est le douzième objet céleste décrit dans le catalogue de Colin Stanley Gum. Elle est située dans les Voiles de l'ancienne constellation du Navire Argo, une constellation visible principalement dans l'hémisphère sud.Son centre est situé à environ 450 parsecs du Système solaire, soit d'environ 1 470 années-lumière.  La nébuleuse de Gum est une rémanence, probablement toujours en expansion, d'une ou plusieurs  supernovas, survenues il y a quelques millions d'années.La nébuleuse de Gum (ou Gum 12) est une énorme nébuleuse diffuse, la plus importante vue de la Terre même si elle est difficile à distinguer sans appareillagespécifique. C'est le douzième objet céleste décrit dans le catalogue de Colin Stanley Gum. Elle est située dans les Voiles de l'ancienne constellation du Navire Argo, une constellation visible principalement dans l'hémisphère sud.Son centre est situé à environ 450 parsecs du Système solaire, soit d'environ 1 470 années-lumière.  La nébuleuse de Gum est une rémanence, probablement toujours en expansion, d'une ou plusieurs  supernovas, survenues il y a quelques millions d'annéesla plus importante vue de la Terre même si elle est difficile à distinguer sans appareillagespécifique. C'est le douzième objet céleste décrit dans le catalogue de Colin Stanley Gum. Elle est située dans les Voiles de l'ancienne constellation du Navire Argo, une constellation visible principalement dans l'hémisphère sud.Son centre est situé à environ 450 parsecs du Système solaire, soit d'environ 1 470 années-lumière.  La nébuleuse de Gum est une rémanence, probablement toujours en expansion, d'une ou plusieurs  supernovas, survenues il y a quelques millions d'années."),
              )
            ],
          )),
        ],
      ),
      bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          padding: EdgeInsets.only(
              left: Dimensions.width20 * 3.5,
              right: Dimensions.width20 * 3.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(
                iconData: Icons.remove,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: 30,
              ),
              BigText(
                text: "\$ 12.88  x  0",
                color: AppColors.mainBlackColor,
              ),
              AppIcon(
                iconData: Icons.add,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: 30,
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
                  Container(
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
                          text: "\$ 10 Add to cart",
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ]),
          ),
        ),
      ]),
    );
  }
}
