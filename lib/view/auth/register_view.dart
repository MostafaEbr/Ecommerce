
import 'package:e_comm/core/view_model/auth_view_model.dart';
import 'package:e_comm/view/widgets/custom_flat_Button.dart';
import 'package:e_comm/view/widgets/customtext.dart';
import 'package:e_comm/view/widgets/customtext_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetWidget<AuthViewModel> {
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
                CustomText(
                  text: "Sign Up",
                  sizeText: 30.0,
                ),
                SizedBox(height: 50.0),
                CustomTextFormField(
                  text: "Name",
                  hint: "SAsa",
                  validator: (value) {
                    if (value == null) print("error");
                  },
                  onSaved: (value) {
                    controller.name = value;
                  },
                ),
                SizedBox(height: 50.0),
                CustomTextFormField(
                  text: "Email",
                  hint: "iamMostafa@gmail.com",
                  validator: (value) {
                    if (value == null) print("error");
                  },
                  onSaved: (value) {
                    controller.email = value;
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                CustomTextFormField(
                  text: "Password",
                  hint: "************",
                  validator: (value) {
                    if (value == null) print("error");
                  },
                  onSaved: (value) {
                    controller.password = value;
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                CustomFlatButton(
                  text: "SIGN UP",
                  onPressed: () {
                    _globalKey.currentState.save();
                    if (_globalKey.currentState.validate()) {
                      controller.createAccountWithEmailAndPassword();
                    }
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
