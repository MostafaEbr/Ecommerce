import 'package:e_comm/core/services/firestoreuser.dart';
import 'package:e_comm/helper/local_storage_data.dart';
import 'package:e_comm/model/usermodel.dart';
import 'package:e_comm/view/controlview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn.standard(scopes: ["email"]);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();
  String email, password, name;

  final LocalStorageData localStorageData = Get.find();

  Rx<User> _user = Rx<User>();

  String get user => _user.value?.email;

  void signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();

    GoogleSignInAuthentication googleUser =
        await googleSignInAccount.authentication;

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleUser.accessToken, idToken: googleUser.idToken);
    UserCredential userCredential =
        // ignore: missing_return
        await _auth.signInWithCredential(credential).then((user) {
          saveUser(user);
          Get.off(ControllerView());
        });

    print(userCredential.user);
  }

  void signInWithFaceBook() async {
    FacebookLoginResult facebookLogInResult =
        await _facebookLogin.logIn(["email"]);

    final accessToken = facebookLogInResult.accessToken.token;
    if (facebookLogInResult.status == FacebookLoginStatus.loggedIn) {
      final userCredential = FacebookAuthProvider.credential(accessToken);

      _auth.signInWithCredential(userCredential).then((user) {
        saveUser(user);
        Get.off(ControllerView());
      });
    }
  }

  void signInWithEmail() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value)async {
          getCurrentUserData(value.user.uid);
        Get.off(ControllerView());
      });
    } catch (e) {
      print(e.message);
      Get.snackbar("Log in Error ,", e.message,
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
      });
      Get.offAll(ControllerView());
    } catch (e) {
      print(e.message);
      Get.snackbar("Log in Error ,", e.message,
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());

    if(_auth.currentUser !=null )
      {

getCurrentUserData(_auth.currentUser.uid);
      }



  }

  getCurrentUserData(String uid) async
  {
    await FireStoreUser().getCurrentData(uid).then((value) {
      setUser(UserModel.fromJason(value.data()));

    });
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  saveUser(UserCredential user) async {
    UserModel userModel =UserModel(
        name: name == null? user.user.displayName : name,
        userId: user.user.uid,
        email: user.user.email,
        pic: "") ;
     await FireStoreUser().addUserFireStore(userModel);
     setUser(userModel);
  }

  setUser(UserModel userModel) async {

    await localStorageData.setUser(userModel);
    print("Done from auth ");
  }

}
