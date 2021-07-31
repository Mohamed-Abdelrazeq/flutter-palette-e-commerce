import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Views/Component/HeaderWithBack.dart';
import 'package:multivender_ecommerce_app/Views/Component/MainButton.dart';
import 'package:multivender_ecommerce_app/Views/Component/MainCard.dart';
import 'package:multivender_ecommerce_app/Views/MyColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double statusBar = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
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
                    children: List.generate(100, (index) {
                      return MainCard(
                        marginRight: 0,
                      );
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
    );
  }
}
