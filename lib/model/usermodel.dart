class UserModel
{

  String name, userId, pic, email;
  UserModel({this.name,this.userId,this.pic,this.email});

  UserModel.fromJason(Map<dynamic,dynamic> map)
  {
    if(map==null)
    {
    return ;
    }
    userId = map["userId"];
    name = map ["name"];
    email = map ["email"];
    pic = map ["pic"];
  }

  toJason(){
    return {
      "name":name,
      "userId":userId,
      "email":email,
      "pic":pic,
    };
  }


}
