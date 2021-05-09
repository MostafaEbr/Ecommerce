import 'package:e_comm/constants.dart';
import 'package:e_comm/core/view_model/cart_product_viewmodel.dart';
import 'package:e_comm/model/bestsellingmodel.dart';
import 'package:e_comm/model/cartproductmodel.dart';

import 'package:e_comm/view/widgets/custom_flat_Button.dart';
import 'package:e_comm/view/widgets/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {

  BestSellingModel model ;

  DetailsView({this.model});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width ,
              height: 250,
              child: Image.network(model.image,
                fit: BoxFit.fill,),
            ),
            SizedBox(height: 25.0,),

            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      CustomText(text: model.name,),
                      SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(15.0),
                            width: MediaQuery.of(context).size.width * 0.42,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(color: Colors.grey)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(text: "Size",),
                                CustomText(text: model.size,),
                              ],
                            ),
                          ),
                          SizedBox(width: 15.0,),
                          Container(
                            padding: EdgeInsets.all(15.0),
                            width: MediaQuery.of(context).size.width * 0.42,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(color: Colors.grey)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(text: "Color",),

                                Container(
                                  width:40.0,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color: model.color,
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      CustomText(
                        text: "Details",
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomText(
                        text: model.description,
                        height: 2.5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      CustomText(
                        text: "PRICE",
                        sizeText: 20.0,
                        color: Colors.grey,
                      ),
                      CustomText(
                        text:"\$"+ model.price,
                        sizeText: 20.0,
                        color: PrimaryColor,
                      ),
                    ],
                  ),
                ),
                  GetBuilder<CartProductViewModel>(
                    init: Get.find(),
                    builder: (controller) {
                      return Container(
                        height: 100.0,
                        width: 180.0,
                        padding: EdgeInsets.all(25.0),
                        child: CustomFlatButton(
                          onPressed: (){
                            controller.addCart(
                              CartProductModel(
                                name: model.name,
                                image: model.image,
                                price: model.price,
                                quantity: 1 ,
                                productId: model.productId
                              )
                            );
                          },
                          text: "ADD",
                        ),
                      );
                    } ,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
