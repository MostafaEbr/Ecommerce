import 'package:e_comm/core/view_model/auth_view_model.dart';
import 'package:e_comm/core/view_model/control_view_model.dart';
import 'package:e_comm/view/auth/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ControllerView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return (Get.find<AuthViewModel>().user ==null )?
      LoginScreen():
      GetBuilder<ControlViewModel>(
        init: ControlViewModel(),
        builder:(controller)=> Scaffold(
            bottomNavigationBar: bottomNavigationBar(),
            body: controller.currentScreen),
      );
    });
  }
}
Widget bottomNavigationBar() {
  return GetBuilder<ControlViewModel>(
    init: Get.find(),
    builder:(controller) =>BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          activeIcon: Padding(
            padding: const EdgeInsets.only(top:25.0),
            child: Text("Explore"),
          ),
          label: ""
          ,icon: Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: Image.asset("assets/images/Icon_Explore.png",
            fit: BoxFit.contain,
            width: 20,
          ),
        ),
        ),
        BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top:25.0),
              child: Text("Cart"),
            ),
            label: ""
            ,icon: Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: Image.asset("assets/images/Icon_Cart.png",
            fit: BoxFit.contain,
            width: 20,),
        )),
        BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text("Account"),
            ),
            label: ""
            ,icon: Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: Image.asset("assets/images/Icon_User.png",
            fit: BoxFit.contain,
            width: 20,),
        )),
      ],
      currentIndex: controller.currentValue,
      onTap: (index) {controller.changeIndex(index);},
      backgroundColor: Colors.grey.shade50,
      selectedItemColor: Colors.black,
      elevation: 0,
    ),
  );
}