import 'package:food_deliver/data/repository/cart_repo.dart';
import 'package:food_deliver/models/Popular_product_model.dart';
import 'package:get/get.dart';

import '../models/cart_product_model copy.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};

  void addItem(ProductModel productModel, int quantity) {
    // print("length of the item is " + _items.length.toString());
    //?ajoute si l'item n'existe pas encore
    _items.putIfAbsent(productModel.id!, () {
      print("add item to cart " +
          productModel.id!.toString() +
          " quantity " +
          quantity.toString());

      _items.forEach(((key, value) {
        print(value.name! + "quantity is " + value.quantity.toString());
      }));

      return CartModel(
        id: productModel.id,
        name: productModel.name,
        price: productModel.price,
        img: productModel.img,
        quantity: quantity,
        isExist: true,
        time: DateTime.now().toString(),
      );
    });
  }
}
