import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;

  final Color color;

  final double sizeText;

  final Alignment alignment ;

  final int maxLines;

  final double height ;
  CustomText({this.text=""
    , this.color = Colors.black
    , this.sizeText = 16.0,
    this.alignment = Alignment.topLeft,
    this.maxLines,
    this.height =1
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        maxLines: maxLines,

        style: TextStyle(color: color,

            height: height,
            fontSize:sizeText),
      ),
    );
  }
}
