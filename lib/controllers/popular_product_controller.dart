import 'package:flutter/material.dart';
import 'package:food_deliver/data/repository/popular_product_repo.dart';
import 'package:food_deliver/models/Popular_product_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      print("got products");

      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);

      update();
    } else {}
  }
}
