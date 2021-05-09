import 'package:e_comm/constants.dart';
import 'package:e_comm/helper/enumdata.dart';
import 'package:e_comm/view/controlview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CheckOutModel extends GetxController

{
  int get index =>_index;
  int _index = 0;

  Pages get pages =>_pages ;
  Pages _pages = Pages.DeliveryTime;


  changeIndex (int i )
  {
    _index=i;
    if(_index==1)
      {
        _pages=Pages.AddAddress;
      }else if(_index == 2)
        {
          _pages= Pages.Summary;
        }
    else {
     Get.to(ControllerView());
    }
    update();
  }


  Color getColor(int i) {
    if (i == _index) {
      return inProgressColor;
    } else if (i < _index) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }



}