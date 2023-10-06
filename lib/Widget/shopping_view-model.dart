// ignore_for_file: unused_element
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../model/wishlist_product_model.dart';
import 'database/database_shopping/database_helper_shopping.dart';


class ShoppingViewModel extends GetxController {
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;
  List<WishListProduct> cart = [];
  double totalPrice = 0.0;
  // double get totalPrice => _totalPrice;

  // on Inite =>
  ShoppingViewModel() {
    getAllProduct();
  }
  static var db = ShoppingDatabase.instance;
  getAllProduct() async {
    cart.clear();
    _loading.value = true;
    cart = await db.getAllProduct();
    _loading.value = false;
    getTotalPrice();
    if (kDebugMode) {
      print("MSG_FAV_LENGTH getAllProduct ${cart.length}");
    }
    update();
  }


  deleteProduct(int id) async {
    for (int i = 0; i < cart.length; i++) {
      (cart[i].id == id) ;
        totalPrice -= (double.parse(cart[i].price.toString()));
      }
    await db.delete2(id);
    await db.delete(id);
    getAllProduct();
    update();
  }

  Future<bool> getProduct(int id) async {   
    return  db.getProductId(id);
  }

  getTotalPrice() {
    for (int i = 0; i < cart.length; i++) {
      totalPrice += (double.parse(cart[i].price.toString()));
    }
    update();
  }

  addProduct(WishListProduct wishListProduct) async {
    if (cart.isEmpty) {
      await db.create(wishListProduct , isFromFav: true);
      cart.add(wishListProduct);
      getAllProduct();
      update();
    } else {
      for (int i = 0; i < cart.length; i++) {
        if (wishListProduct.id == cart[i].id) {
          return;
        }
      }
      await db.create(wishListProduct , isFromFav: true);
      cart.add(wishListProduct);
      getAllProduct();
      update();
    }
    
  }
}
