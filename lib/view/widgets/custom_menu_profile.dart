import 'package:flutter/material.dart';

class CustomMenuProfile extends StatelessWidget {

  final String optionName ;
  final String image ;
  final Function onPressed ;
  final IconData iconData ;

  CustomMenuProfile({this.optionName,this.image,this.onPressed,this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: onPressed,
        child: ListTile(
          title: Text(optionName),
          leading: Container(
              height: 25,
              width: 25,
              child: Image.asset(image)),
          trailing: Icon(iconData,
            color: Colors.black,),

        ),
      ),
    );
  }
}
