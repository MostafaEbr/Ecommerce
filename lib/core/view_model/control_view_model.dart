import 'package:e_comm/view/cart_view.dart';
import 'package:e_comm/view/home_view.dart';
import 'package:e_comm/view/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
class ControlViewModel extends GetxController
{
  int _currentValue  = 0 ;

  get currentValue => _currentValue ;

  Widget currentScreen = HomeView();


  void changeIndex (int indexValue)
  {
    _currentValue=indexValue ;
    switch(_currentValue)
    {
      case 0 :
        {
          currentScreen = HomeView();
          break;
        }
      case 1 :
        {
          currentScreen = CartView();
          break;
        }
      case 2 :
        {
          currentScreen = ProfileView();
          break;
        }
    }
    update();

  }

}