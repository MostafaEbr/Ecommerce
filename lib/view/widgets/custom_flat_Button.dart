import 'package:e_comm/constants.dart';
import 'package:e_comm/view/widgets/customtext.dart';
import 'package:flutter/material.dart';
class CustomFlatButton extends StatelessWidget {
  final String text ;
  final Function onPressed ;

  CustomFlatButton({this.text,this.onPressed});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(16.0),
      onPressed: onPressed,
      color: PrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: CustomText(text: text, alignment: Alignment.center,color: Colors.white,),
    )
    ;
  }
}
