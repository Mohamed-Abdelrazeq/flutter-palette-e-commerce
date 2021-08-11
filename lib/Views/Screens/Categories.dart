import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Views/Component/HeaderWithBack.dart';
import 'package:multivender_ecommerce_app/Views/Component/MainButton.dart';
import 'package:multivender_ecommerce_app/Views/Component/MainCategoryCard.dart';
import 'package:multivender_ecommerce_app/Views/MyColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categories extends StatelessWidget {
  final List<Map> cats = [
    {"cate": "Crafts", "imgPath": "images/cate/crafts.jpg"},
    {"cate": "Knit", "imgPath": "images/cate/knit.jpg"},
    {"cate": "Art", "imgPath": "images/cate/art.jpg"},
    {"cate": "Plant", "imgPath": "images/cate/Cactus.png"},
    {"cate": "Clothes", "imgPath": "images/cate/clothes.jpg"},
    {"cate": "Accessories", "imgPath": "images/cate/accec.jpg"},
  ];
  @override
  Widget build(BuildContext context) {
    double statusBar = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        height: 667.h,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.only(top: statusBar.h, right: 28.w, left: 28.w),
                child: Column(
                  children: [
                    HeaderWithBack(header: "Categories"),
                    GridView.count(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      padding: EdgeInsets.only(bottom: 100.h),
                      children: List.generate(cats.length, (index) {
                        return MainCategoryCard(
                            marginRight: 0,
                            cate: cats[index]["cate"],
                            imgPath: cats[index]["imgPath"]);
                      }),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20.h,
              child: MainButton(text: "Products", btnFunction: (){
                Navigator.pushNamed(context, "/Products");
              }),
            ),
          ],
        ),
      ),
    );
  }
}
