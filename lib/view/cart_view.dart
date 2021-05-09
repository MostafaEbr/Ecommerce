import 'package:e_comm/constants.dart';
import 'package:e_comm/core/view_model/cart_product_viewmodel.dart';

import 'package:e_comm/view/widgets/custom_flat_Button.dart';
import 'package:e_comm/view/widgets/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'checkout/checkout_view.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  GetBuilder<CartProductViewModel>(
        init: Get.find(),
          builder: (controller) => controller.product.length == 0 ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/empty.svg",height: 200,width: 200,),
              SizedBox(height: 20,),
              CustomText(text: "Cart Empty ",alignment: Alignment.topCenter,sizeText: 28,color: Colors.green,)
            ],
          ):
        Column(
          children: [
            Expanded(
              child:   Container(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10.0,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 150.0,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Container(
                              width: 140,
                              child: Image.network(
                                controller.product[index].image,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 25.0, left: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: controller.product[index].name,
                                    sizeText: 24.0,
                                  ),
                                  SizedBox(
                                    height: 6.0,
                                  ),
                                  CustomText(
                                    text: "\$" +  controller.product[index].price.toString(),
                                    color: PrimaryColor,
                                    sizeText: 20.0,
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Container(
                                    width: 100,
                                    height: 30.0,
                                    color: Colors.grey.shade200,
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          child: Icon(
                                            Icons.add,
                                          ),
                                          onTap: (){
                                            controller.increaseQuantity(index);
                                          },
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        CustomText(
                                          text:  controller.product[index].quantity.toString(),
                                          sizeText: 20.0,
                                          color: Colors.black,
                                          alignment: Alignment.center,
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Align(
                                            alignment: Alignment.center,
                                            child: GestureDetector(
                                              child: Icon(
                                                Icons.minimize,
                                              ),
                                              onTap: (){
                                                controller.decreaseQuantity(index);
                                              },
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount:  controller.product.length,
                  ),
                ),

            ),
            Container(
              padding: EdgeInsets.only(right: 20.0, left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      children: [
                        CustomText(
                          text: "TOTAL",
                          sizeText: 20.0,
                        ),
                        GetBuilder<CartProductViewModel>(
                          init:Get.find(),
                          builder:(controller) =>  CustomText(
                            text: "\$ ${controller.totalprice}",
                            color: PrimaryColor,
                            sizeText: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(25.0),
                      height: 100.0,
                      width: 180.0,
                      child: CustomFlatButton(
                        text: "CHECKOUT",
                        onPressed: () {
                          Get.to(()=>CheckOutView());
                        },
                      ))
                ],
              ),
            ),],
        ),
        ),
    );
  }
}
