import 'package:e_comm/core/view_model/profile_view_model.dart';
import 'package:e_comm/view/auth/login_screen.dart';
import 'package:e_comm/view/widgets/custom_menu_profile.dart';
import 'package:e_comm/view/widgets/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) {

        return controller.userModel==null ? Center(child: CircularProgressIndicator()) : Scaffold(
          body: Container(
            padding: EdgeInsets.only(
              top: 50.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 120.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                            color: Colors.white ,
                            borderRadius:
                            BorderRadius.all(Radius.circular(100.0)),
                            image:DecorationImage(
                              image: controller.userModel.pic==null?
                              AssetImage("assets/images/menu_icon/avatar.png"):controller.userModel.pic=="default" ?
                              AssetImage("assets/images/menu_icon/avatar.png"):NetworkImage(controller.userModel.pic)
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            CustomText(text: controller.userModel.name==null?"":controller.userModel.name),
                            SizedBox(
                              height: 10,
                            ),
                            CustomText(text: controller.userModel.email==null?"":controller.userModel.email)
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 75.0,
                  ),
                  CustomMenuProfile(
                    iconData: Icons.navigate_next,
                    image: "assets/images/menu_icon/resume.png",
                    optionName: "Edit Profile",
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  CustomMenuProfile(
                    iconData: Icons.navigate_next,
                    image: "assets/images/menu_icon/home-address.png",
                    optionName: "Shipping Address",
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  CustomMenuProfile(
                    iconData: Icons.navigate_next,
                    image: "assets/images/menu_icon/history.png",
                    optionName: "Order History ",
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  CustomMenuProfile(
                    iconData: Icons.navigate_next,
                    image: "assets/images/menu_icon/credit-card.png",
                    optionName: "Cards",
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  CustomMenuProfile(
                    iconData: Icons.navigate_next,
                    image: "assets/images/menu_icon/notification.png",
                    optionName: "Notification",
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  CustomMenuProfile(
                    image: "assets/images/menu_icon/logout.png",
                    optionName: "Log Out",
                    onPressed: () {
                      controller.signOut();
                      Get.offAll(LoginScreen());
                    },
                  ),
                ],
              ),
            ),
          ),
        ) ;
      }
    );
  }
}
