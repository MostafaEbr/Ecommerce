import 'package:e_comm/constants.dart';
import 'package:e_comm/core/view_model/checkout_view_model.dart';
import 'package:e_comm/helper/enumdata.dart';
import 'package:e_comm/view/checkout/add_address_widget.dart';
import 'package:e_comm/view/checkout/delevery_time_widget.dart';
import 'package:e_comm/view/checkout/summary_widget.dart';
import 'package:e_comm/view/widgets/custom_flat_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:status_change/status_change.dart';


class CheckOutView extends  StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutModel>(
    init: CheckOutModel(),
      builder: (controller) =>  Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "CheckOut",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 100,
              child: StatusChange.tileBuilder(

                theme: StatusChangeThemeData(
                  direction: Axis.horizontal,
                  connectorTheme: ConnectorThemeData(space: 1.0, thickness: 1.0),
                ),
                builder: StatusChangeTileBuilder.connected(

                  itemWidth: (_) =>
                  MediaQuery.of(context).size.width / _processes.length,
                  nameWidgetBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        _processes[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: controller.getColor(index),
                        ),
                      ),
                    );
                  },
                  indicatorWidgetBuilder: (_, ind) {
                    if (ind <= controller.index) {
                      return DotIndicator(
                        size: 35.0,
                        border: Border.all(color: Colors.green, width: 1),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return OutlinedDotIndicator(
                        size: 30,
                        borderWidth: 1.0,
                        color: todoColor,
                      );
                    }
                  },
                  lineWidgetBuilder: (i) {
                    if (i > 0) {
                      if (i == controller.index) {
                        final prevColor = controller.getColor(i - 1);
                        final color = controller.getColor(i);
                        var gradientColors;
                        gradientColors = [
                          prevColor,
                          Color.lerp(prevColor, color, 0.5)
                        ];
                        return DecoratedLineConnector(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: gradientColors,
                            ),
                          ),
                        );
                      } else {
                        return SolidLineConnector(
                          color: controller.getColor(i),
                        );
                      }
                    } else {
                      return null;
                    }
                  },
                  itemCount: _processes.length,
                ),
              ),
            ),
            controller.pages == Pages.DeliveryTime
                ? DeliveryTime()
                :controller.pages == Pages.AddAddress
                ? AddAddress()
                : Summary(),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.all(10.0),
                height: 80.0,
                width: 200.0,
                child: CustomFlatButton(text: "Next",
                onPressed: (){
                  controller.changeIndex(controller.index+1);
                },
                ),
              ),
            )
          ],
        ),

      )
    );
  }
}

final _processes = [
  'Delivery',
  'Address',
  'Summer',
];