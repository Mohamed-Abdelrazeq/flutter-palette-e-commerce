import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multivender_ecommerce_app/Views/Component/Header.dart';
import 'package:multivender_ecommerce_app/Views/Component/MainButton.dart';
import 'package:multivender_ecommerce_app/Views/Component/MainCard.dart';
import 'package:multivender_ecommerce_app/Views/Component/MyTextField.dart';

import '../MyColors.dart';
class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  TextEditingController _searchTextController;

  @override
  Widget build(BuildContext context) {
    double statusBar = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: EdgeInsets.only(top: statusBar.h,),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 28.w,right: 28.w),
                child: Column(
                  children: [
                    Header(header: "Cart",),
                    MyTextFiled(textController: _searchTextController, myIcon: Icons.search, hint: "Search"),
                    SizedBox(height: 22.h,),
                  ],
                ),
              ),

              Stack(
                alignment: Alignment.bottomCenter,
                children:[
                  Container(
                  height: 410.h,
                  width: 375.w,
                  padding: EdgeInsets.only(bottom: 9.h,),
                  child: GridView.count(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    padding: EdgeInsets.only(left: 28.w,right: 28.w,bottom: 100.h),
                    children: List.generate(5, (index) {
                      return MainCard(marginRight: 0,);
                    }),
                  ),
                ),
                  Positioned(
                    bottom: 25.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.w),
                      child: MainButton(text: "Checkout", btnFunction: (){
                        //Todo
                      }),
                    ),
                  ),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
