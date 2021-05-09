import 'package:e_comm/core/view_model/auth_view_model.dart';
import 'package:e_comm/core/view_model/cart_product_viewmodel.dart';
import 'package:e_comm/core/view_model/control_view_model.dart';
import 'package:e_comm/core/view_model/home_view_model.dart';
import 'package:e_comm/core/view_model/profile_view_model.dart';
import 'package:e_comm/helper/local_storage_data.dart';
import 'package:e_comm/view/checkout/checkout_view.dart';
import 'package:get/get.dart';


class Binding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartProductViewModel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => ProfileViewModel());
    Get.lazyPut(() => CheckOutView());
  }

}