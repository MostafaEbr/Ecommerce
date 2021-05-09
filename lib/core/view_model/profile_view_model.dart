import 'package:e_comm/helper/local_storage_data.dart';
import 'package:e_comm/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


class ProfileViewModel extends GetxController
{


  UserModel get userModel => _userModel ;
  UserModel _userModel = UserModel ();

  final LocalStorageData _localStorageData=Get.find();


  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

  void getUserData () async
  {
    await _localStorageData.getUserData.then((value) {
      _userModel =value;
    }
    );
    update();
  }

  Future<void> signOut () async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    _localStorageData.deleteUser();

  }

}