

class CategoryModel {

  String name;
  String image;

  CategoryModel({this.name,this.image});

  CategoryModel.fromJason(Map<dynamic,dynamic>map)
  {
    if(map==null)
      {
        return ;
      }
    name = map["name"];
    image=map["image"];
  }

  toJason(){
    return {
       "name":name,
       "image":image
    };
  }

}