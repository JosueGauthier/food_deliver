import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver/utils/colors.dart';
import 'package:food_deliver/utils/dimensions.dart';
import 'package:food_deliver/widget/app_icon.dart';
import 'package:food_deliver/widget/big_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Text(
                "La nébuleuse de Gum (ou Gum 12) est une énorme nébuleuse diffuse, la plus importante vue de la Terre même si elle est difficile à distinguer sans appareillagespécifique. C'est le douzième objet céleste décrit dans le catalogue de Colin Stanley Gum. Elle est située dans les Voiles de l'ancienne constellation du Navire Argo, une constellation visible principalement dans l'hémisphère sud.Son centre est situé à environ 450 parsecs du Système solaire, soit d'environ 1 470 années-lumière.  La nébuleuse de Gum est une rémanence, probablement toujours en expansion, d'une ou plusieurs  supernovas, survenues il y a quelques millions d'années.La nébuleuse de Gum (ou Gum 12) est une énorme nébuleuse diffuse, la plus importante vue de la Terre même si elle est difficile à distinguer sans appareillagespécifique. C'est le douzième objet céleste décrit dans le catalogue de Colin Stanley Gum. Elle est située dans les Voiles de l'ancienne constellation du Navire Argo, une constellation visible principalement dans l'hémisphère sud.Son centre est situé à environ 450 parsecs du Système solaire, soit d'environ 1 470 années-lumière.  La nébuleuse de Gum est une rémanence, probablement toujours en expansion, d'une ou plusieurs  supernovas, survenues il y a quelques millions d'années."),
          ),
          SliverFillRemaining(
            child: Column(
              children: [Text('some cool text here')],
            ),
          )
        ],
      ),
    );
  }
}
