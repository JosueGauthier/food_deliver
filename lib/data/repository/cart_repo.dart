import 'dart:convert';

import 'package:food_deliver/utils/app_constats.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_product_model.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart = [];

  List<String> cartHistory = [];

  //! convertit le contenu du panier en une chaine de caractère json

  void addToCartList(List<CartModel> cartList) {
    cart = [];

    /*
    ?convert objects to string because shared pref only accept string*/

    cartList.forEach((element) {
      return cart.add(jsonEncode(element));
    });

    sharedPreferences.setStringList(AppConstats.CART_LIST, cart);
    //print(sharedPreferences.getStringList(AppConstats.CART_LIST));
    getCartList();
  }

  //! convertit une string json en objet CartModel
  List<CartModel> getCartList() {
    List<String> carts = [];

    if (sharedPreferences.containsKey(AppConstats.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstats.CART_LIST)!;
      //print("inside getCartList" + carts.toString());
    }

    List<CartModel> cartList = [];

    //? les deux blocs realisent la meme chose.

    carts.forEach((element) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    });

    //*carts.forEach((element) => CartModel.fromJson(jsonDecode(element)));

    return cartList;
  }

  void addToCartHistoryList() {
    for (int i = 0; i < cart.length; i++) {
      print("history list" + cart[i]);
      cartHistory.add(cart[i]);
    }

    removeCart();

    sharedPreferences.setStringList(AppConstats.CART_HISTORY_LIST, cartHistory);
  }

  void removeCart() {
    sharedPreferences.remove(AppConstats.CART_LIST);
  }

  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstats.CART_HISTORY_LIST)) {
      cartHistory = [];
      cartHistory =
          sharedPreferences.getStringList(AppConstats.CART_HISTORY_LIST)!;
    }

    List<CartModel> cartListHistory = [];
    cartHistory.forEach((element) =>
        cartListHistory.add(CartModel.fromJson(jsonDecode(element))));
    return cartListHistory;
  }
}
