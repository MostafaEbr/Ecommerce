import 'package:e_comm/constants.dart';
import 'package:e_comm/core/view_model/auth_view_model.dart';
import 'package:e_comm/view/auth/register_view.dart';
import 'package:e_comm/view/widgets/custom_flat_Button.dart';
import 'package:e_comm/view/widgets/custom_flat_button_soial.dart';
import 'package:e_comm/view/widgets/customtext.dart';
import 'package:e_comm/view/widgets/customtext_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Form(
            key: _globalKey,
            child: SingleChildScrollView(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Welcome,",
                      sizeText: 30.0,
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.to(RegisterView());
                      },
                      child: CustomText(
                        text: "Sign Up",
                        color: PrimaryColor,
                        sizeText: 18.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                CustomText(
                  text: "Sign in to Continue ",
                  color: Colors.grey,
                  sizeText: 14.0,
                ),
                SizedBox(height: 50.0),
                CustomTextFormField(
                  text: "Email",
                  hint: "iamMostafa@gmail.com",
                  validator: (value) {
                    if(value==null)
                      print("error");

                  },
                  onSaved: (value) {
                    controller.email = value ;
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                CustomTextFormField(
                  text: "Password",
                  hint: "************",
                  validator: (value) {
                    if(value==null)
                      print("error");
                  },
                  onSaved: (value) {
                    controller.password= value ;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomText(
                  text: "Forget Password",
                  color: Colors.black,
                  alignment: Alignment.topRight,
                  sizeText: 14.0,
                ),
                SizedBox(
                  height: 15.0,
                ),
                CustomFlatButton(
                  text: "SIGN IN",
                  onPressed: () {
                    _globalKey.currentState.save();
                    if(_globalKey.currentState.validate())
                      {
                        controller.signInWithEmail();
                      }
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                CustomText(
                  text: "-OR-",
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 30.0,
                ),
                CustomButtonSocial(
                  text: "Sign In With Facebook",
                  image: "assets/images/face.png",
                  onPressed: () {
                    controller.signInWithFaceBook();
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                CustomButtonSocial(
                  text: "Sign In With Gmail",
                  image: "assets/images/mail.png",
                  onPressed: () {
                    controller.signInWithGoogle();
                  },
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
