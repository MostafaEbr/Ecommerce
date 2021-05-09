import 'package:e_comm/core/services/database/cart_database_helper.dart';
import 'package:e_comm/model/cartproductmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProductViewModel extends GetxController {

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  var dbHelper = CartDatabaseHelper.db;
  double get totalprice => _totalPrice;
  double _totalPrice = 0.0;

  List <CartProductModel> get product => _product;
  List <CartProductModel> _product = [];

  CartProductViewModel() {
    getAllProduct();
  }

  getAllProduct() async {
    _loading.value = true;

    _product = await dbHelper.getAllProduct();
    print(_product.length);
    _loading.value = false;
    getAllTotalPrice();
    update();
  }

  getAllTotalPrice() {
    for (int i = 0; i < _product.length; i++) {
      _totalPrice += (double.parse(_product[i].price) * _product[i].quantity);
      print(_totalPrice);
      update();
    }

  }
  addCart(CartProductModel cartProductModel) async {
      for (int i = 0; i < _product.length; i++) {
        if (_product[i].productId == cartProductModel.productId) {
          return;
        }
      }

      await dbHelper.insert(cartProductModel);
      _product.add(cartProductModel);
      _totalPrice += (double.parse(cartProductModel.price) * cartProductModel.quantity);
      update();
    }

    increaseQuantity (int index )async{
    _product[index].quantity++;
    _totalPrice += (double.parse(_product[index].price));

    await dbHelper.updateProduct(_product[index]);

    update();

    }
  decreaseQuantity (int index ) async{
    _product[index].quantity--;
    _totalPrice -= (double.parse(_product[index].price) );

   await dbHelper.updateProduct(_product[index]);
    update();

  }
}
