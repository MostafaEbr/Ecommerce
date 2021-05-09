import 'package:e_comm/constants.dart';
import 'package:e_comm/model/usermodel.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController {

  Future<UserModel> get getUserData async{
    try{
      UserModel userModel =await _getUser();
      if(userModel==null)
        {return null ;}

        return userModel;

    }
    catch(e)
    {
      print(e.toString());
    return null;
    }
  }


  _getUser() async {
    SharedPreferences sPref = await SharedPreferences.getInstance();
    var value = sPref.getString(CACHED_STORAGE_DATA);

    return UserModel.fromJason(json.decode(value));
  }

  setUser(UserModel userModel) async {
    SharedPreferences sPref = await SharedPreferences.getInstance();
    sPref.setString(CACHED_STORAGE_DATA, json.encode(userModel.toJason()));
  }

  void deleteUser ()async {
    SharedPreferences sPref = await SharedPreferences.getInstance();
   sPref.clear();
  }
}
