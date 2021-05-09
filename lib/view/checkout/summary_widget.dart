import 'package:e_comm/constants.dart';
import 'package:e_comm/core/view_model/cart_product_viewmodel.dart';
import 'package:e_comm/model/cartproductmodel.dart';
import 'package:e_comm/view/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartProductViewModel>(
      builder: (controller) => Expanded(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 350,
                padding: EdgeInsets.all(20.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Container(
                    child: SizedBox(width: 20.0,),
                  ),
                  itemBuilder: (context, index) => Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 180,
                          width: 150,
                          child: Image.network(
                            controller.product[index].image,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        CustomText(
                          text: controller.product[index].name,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        CustomText(
                          color: PrimaryColor,
                          text: controller.product[index].price + "\$",
                          alignment: Alignment.bottomLeft,

                        )
                      ],
                    ),
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.product.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
