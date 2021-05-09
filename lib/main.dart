import 'package:e_comm/helper/binding.dart';

import 'package:e_comm/view/controlview.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

import 'core/view_model/cart_product_viewmodel.dart';

void main ()async{

  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
 Get.put(CartProductViewModel());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      home: Scaffold(

        body: ControllerView(),
      ),
      theme: ThemeData(
        fontFamily: "SourceSans"
      ),
    );
  }
}
