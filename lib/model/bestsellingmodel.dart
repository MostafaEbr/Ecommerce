import 'package:e_comm/helper/hexcolor.dart';
import 'package:flutter/material.dart';

class BestSellingModel {
  String productId, name, description, image, price, size;

  Color color ;
  BestSellingModel({this.name,this.image,this.description,this.size,this.color,this.price,this.productId});


  BestSellingModel.fromJason (Map<dynamic,dynamic>map)
  {
    if(map==null)
      {
        return;
      }

    name = map["name"];
    description= map["description"];
    image = map["image"];
    size = map["size"];
    color = HexColor.fromHex(map["color"])  ;
    price = map["price"];
    productId = map["productId"];

  }

  toJason(){
    return {
      "name" : name,
      "image" : image,
      "description" : description,
      "color" : color,
      "size" : size,
      "price" : price,
      "productId" : productId,
    };
  }

}