
import 'package:e_comm/core/view_model/home_view_model.dart';

import 'package:e_comm/view/details_view.dart';
import 'package:e_comm/view/widgets/customtext.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            body: Container(
          padding: EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0),
          child: SingleChildScrollView(
            child: Column(
            children: [
              _searchTextFieldForm(),
              SizedBox(
                height: 20.0,
              ),
              CustomText(
                text: "Categories",
              ),
              SizedBox(
                height: 20.0,
              ),
              _listViewCatogry(),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Best Selling",
                    color: Colors.black,
                    sizeText: 19.0,
                  ),
                  CustomText(
                    text: "See all",
                    color: Colors.black,
                    sizeText: 17.0,
                  )
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              _listViewProducts(context),
            ],
              ),
          ),
        ),
    );
  }
}

Widget _searchTextFieldForm() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0), color: Colors.grey.shade200),
    child: TextFormField(
      decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          )),
    ),
  );
}

Widget _listViewCatogry() {
  return GetBuilder<HomeViewModel>(
    init: HomeViewModel(),
    builder:(controller)=>controller.loading.value ? CircularProgressIndicator() : Container(
      child: Container(
        height: 100.0,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.grey.shade200),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(controller.categoryModel[index].image),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(controller.categoryModel[index].name)
              ],
            );
          },
          itemCount: controller.categoryModel.length,
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: 20.0,
          ),
        ),
      ),
    ),
  );
}

Widget _listViewProducts(context) {
  return GetBuilder<HomeViewModel>(
    builder:(controller)=> controller.loading.value ?Center(child: CircularProgressIndicator()) :
    Container(
      height: 300,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          width: 25.0,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: GestureDetector(
              onTap: (){
                Get.to(DetailsView(model: controller.bestSellingModel[index],));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .4,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 220.0,
                        child: Image.network(
                          controller.bestSellingModel[index].image,
                          fit: BoxFit.fill,
                        )),
                    SizedBox(
                      height: 10.0,
                    ),
                    CustomText(
                      text: controller.bestSellingModel[index].name,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    CustomText(
                      text: controller.bestSellingModel[index].description,
                      maxLines: 1,
                      sizeText: 12.0,
                      alignment: Alignment.bottomLeft,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    CustomText(
                      text: controller.bestSellingModel[index].price,
                      sizeText: 12.0,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: controller.bestSellingModel.length,
      ),
    ),
  );
}
