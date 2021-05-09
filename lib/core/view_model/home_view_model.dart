
import 'package:e_comm/core/services/homeservice.dart';
import 'package:e_comm/model/bestsellingmodel.dart';
import 'package:e_comm/model/catogerymodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];


  List<BestSellingModel> _bestSellingModel = [];
  List<BestSellingModel> get bestSellingModel =>_bestSellingModel;

  HomeViewModel() {
    getCategory();
    getBestSelling();
  }

  getCategory() async
  {
    HomeService _homeService = HomeService();
    _loading.value = true;
    await _homeService.getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        categoryModel.add(CategoryModel.fromJason(value[i].data()));
        _loading.value = false;
      }

      update();
    });


  }
  getBestSelling() async {
    _loading.value = true;
    HomeService _productSelling = HomeService();
    await _productSelling.getProductSell().then((value) {
      for (int i = 0; i<value.length;i++)
      {
        _bestSellingModel.add(BestSellingModel.fromJason(value[i].data()));
        _loading.value=false;
      }
    });
    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _bestSellingModel.clear();
  }
}