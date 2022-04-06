import 'package:food_deliver/data/repository/cart_repo.dart';
import 'package:food_deliver/models/Popular_product_model.dart';
import 'package:get/get.dart';

import '../models/cart_product_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;

  void addItem(ProductModel productModel, int quantity) {
    if (_items.containsKey(productModel.id!)) {
      _items.update(productModel.id!, (value) {
        if ((value.quantity! + quantity) > 0) {
          return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity: value.quantity! + quantity,
            isExist: true,
            time: DateTime.now().toString(),
            aProduct: productModel,
          );
        } else {
          return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity: 0,
            isExist: true,
            time: DateTime.now().toString(),
            aProduct: productModel,
          );
        }
      });
    } else {
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
          aProduct: productModel,
        );
      });
    }

    if (_items[productModel.id]?.quantity! == 0) {
      _items.remove(productModel.id!);
    }

    update();
  }

  void removeItem(ProductModel productModel) {
    if (_items.containsKey(productModel.id!)) {
      _items.remove(productModel.id!);
    }
  }

  bool existinCart(ProductModel aProduct) {
    if (_items.containsKey(aProduct.id)) {
      return true;
    } else {
      return false;
    }
  }

  int getQuantity(ProductModel aProduct) {
    var quantity = 0;

    if (_items.containsKey(aProduct.id)) {
      _items.forEach((key, value) {
        if (key == aProduct.id) {
          quantity = value.quantity!;
        }
      });
    }

    return quantity;
  }

  int get totalItems {
    int totalQuantity = 0;

    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });

    return totalQuantity;
  }

  List<CartModel> get getItems {
    //? e est un item de cartModel avec int, CartModel
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get totalAmount {
    var total = 0;

    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });

    return total;
  }
}
