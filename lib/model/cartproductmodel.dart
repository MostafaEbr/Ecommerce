

class CartProductModel {
  String name,  image, price ,productId ;

  int quantity ;
  CartProductModel({this.name,this.image,this.price,this.quantity,this.productId});


  CartProductModel.fromJason (Map<dynamic,dynamic>map)
  {
    if(map==null)
    {
      return;
    }

    name = map["name"];
    image = map["image"];
    price = map["price"];
    quantity = map ["quantity"];
    productId = map ["productId"];

  }

  toJason(){
    return {
      "name" : name,
      "image" : image,
      "price" : price,
      "Quantity" : quantity,
      "productId" : productId
    };
  }

}