import 'package:flutter/material.dart';
class CustomButtonSocial extends StatelessWidget {
  final String image ;
  final String text ;
  final Function onPressed ;

  CustomButtonSocial({this.text,this.image,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  FlatButton(
      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(15.0),

      ),
      onPressed: onPressed,
      padding: EdgeInsets.all(15.0),
      color: Colors.grey.shade200,
      child: Row(
        children: [
          Image.asset(image),
          SizedBox(width: 50.0,),
          Text(text),
        ],
      ),
    );
  }
}
