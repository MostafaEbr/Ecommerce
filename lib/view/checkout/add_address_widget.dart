import 'package:e_comm/view/widgets/customtext.dart';
import 'package:e_comm/view/widgets/customtext_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40.0,
              ),
            CustomText(text: "Billing address is the same as delivery address",
            sizeText: 18.0,
            alignment: Alignment.center,),
            SizedBox(height: 20.0,),
            CustomTextFormField(
              text: "Street 1",
              hint: "21 , Cairo Qaliub ",
            ),
              SizedBox(height: 20.0,),
              CustomTextFormField(
                text: "Street 2",
                hint: "21 , Qaluib ",
              ),

              SizedBox(height: 20.0,),
              CustomTextFormField(
                text: "City",
                hint: "Qalyubia ",
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: Get.width,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: CustomTextFormField(
                          text: "State",
                          hint: "qaliub ",
                        ),
                      ),
                    ),
                    SizedBox(width: 30.0,),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left:20.0),
                        child: CustomTextFormField(
                          text: "data",
                          hint: "addsa",
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
