import 'package:flutter/material.dart';
import 'customtext.dart';
class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hint ;
  final Function onSaved ;
  final Function validator ;

  CustomTextFormField({this.text, this.hint, this.onSaved, this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: [
            CustomText(
              text:text,sizeText: 14.0,color: Colors.black,),
            TextFormField(
              onSaved: onSaved,
              validator: validator,
              decoration: InputDecoration(
                  hintText:hint,
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  fillColor: Colors.black
              ),
            ),
          ]
      ),

    );
  }
}
