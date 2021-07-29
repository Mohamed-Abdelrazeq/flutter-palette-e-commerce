import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:multivender_ecommerce_app/Views/Component/BNBar.dart';
import 'package:multivender_ecommerce_app/Views/Component/Header.dart';
import 'package:multivender_ecommerce_app/Views/Component/MainCard.dart';
import 'package:multivender_ecommerce_app/Views/Component/MyTextField.dart';
import 'package:multivender_ecommerce_app/Views/Component/SeactionHeader.dart';
import 'package:multivender_ecommerce_app/Views/MyColors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _searchTextController;

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(bgColor);
    double statusBar = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: EdgeInsets.only(top: statusBar.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 28.w,right: 28.w),
                child: Column(
                  children: [
                    Header(),
                    MyTextFiled(textController: _searchTextController, myIcon: Icons.search, hint: "Search"),
                    SizedBox(height: 22.h,),
                    SectionHeader(header: "Categories",),
                  ],
                ),
              ),
              Container(
                height: 150.h,
                width: 375.w,
                margin: EdgeInsets.only(left: 28.w ,right: 8.w),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    MainCard(),
                    MainCard(),
                    MainCard(),
                    MainCard(),
                    MainCard(),
                    MainCard(),
                    MainCard(),
                    MainCard(),
                  ],
                ),
              ),
              SizedBox(height: 22.h,),
              Padding(
                padding: EdgeInsets.only(left: 28.w,right: 28.w),
                child: SectionHeader(header: "Products",),
              ),
              Container(
                height: 150.h,
                width: 375.w,
                margin: EdgeInsets.only(left: 28.w ,right: 8.w),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    MainCard(),
                    MainCard(),
                    MainCard(),
                    MainCard(),
                    MainCard(),
                    MainCard(),
                    MainCard(),
                    MainCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
