import 'package:e_comm/constants.dart';
import 'package:e_comm/helper/enumdata.dart';
import 'package:e_comm/view/widgets/customtext.dart';
import 'package:flutter/material.dart';

class DeliveryTime extends StatefulWidget {

  @override
  _DeliveryTimeState createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivery delivery = Delivery.StandardDelivery;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 60.0,),
          RadioListTile<Delivery>(
            title: CustomText(text: "Standard Delivery",sizeText: 24.0,),
              subtitle: CustomText(
                text: "\nOrder Will be delivered between 3 - 5 business days ",
                sizeText: 16.0,),
              activeColor: PrimaryColor,
              value: Delivery.StandardDelivery,
              groupValue: delivery,
              onChanged: (value){

              setState(() {

                delivery=value;
              });
              }),
          SizedBox(height: 50.0,),
          RadioListTile<Delivery>(
            title: CustomText(text: "Next Day Delivery",sizeText: 24.0,),
              subtitle: CustomText(
                text: "\nPlace your order before 6pm and your items will be delivered the next day  ",
                sizeText: 16.0,),
              activeColor: PrimaryColor,
              value: Delivery.NextDayDelivery,
              groupValue: delivery,
              onChanged: (value){
                setState(() {

                  delivery=value;
                });
              }),
          SizedBox(height: 50,),
          RadioListTile<Delivery>(
            title: CustomText(text: "Nominated Delivery",sizeText: 24.0,),
              subtitle: CustomText(
                text: "\nPick a particular data from the calender and order will be delivered on selected date ",
                sizeText: 16.0,),
              activeColor: PrimaryColor,
              value: Delivery.NominatedDelivery,
              groupValue: delivery,
              onChanged: (value){
                setState(() {
                  delivery=value;
                });
              }),
        ],
      ),
    );
  }
}
