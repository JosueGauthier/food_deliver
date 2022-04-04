import 'package:flutter/material.dart';
import 'package:food_deliver/controllers/cart_controller.dart';
import 'package:food_deliver/data/repository/popular_product_repo.dart';
import 'package:food_deliver/models/Popular_product_model.dart';
import 'package:food_deliver/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  //! var for getPopularProductList

  List<dynamic> _popularProductList = [];

  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  //!
  late CartController _cartController;

  //! var for setQuantity

  int _quantity = 0;

  int get quantity => _quantity;

  int _incartItem = 0;

  int get inCartItem => _incartItem + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    print("Popular status code " + response.statusCode.toString());

    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      //print(popularProductList);
      _isLoaded = true;

      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int qquantity) {
    if (qquantity < 0) {
      Get.snackbar("Item count", "You can't reduce more !",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 0;
    } else if (qquantity > 20) {
      Get.snackbar("Item count", "You can't add more ! ",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return qquantity;
    }
  }

  void initProduct(CartController cartController) {
    _quantity = 0;

    _incartItem = 0;

    _cartController = cartController;

    // get from storage
  }

  void popular_addItem(ProductModel productModel) {
    if (_quantity > 0) {
      _cartController.addItem(productModel, _quantity);
    } else {
      Get.snackbar(
          "Item count", "You should at least add one item to the cart !",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
    }
  }
}
