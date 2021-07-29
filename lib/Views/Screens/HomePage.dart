import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multivender_ecommerce_app/Views/Component/Header.dart';
import 'package:multivender_ecommerce_app/Views/Component/SearchBar.dart';
import 'package:multivender_ecommerce_app/Views/MyColors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double statusBar = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: EdgeInsets.only(left: 28.w,right: 28.w,top: statusBar.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(),
              SearchBar(),

            ],
          ),
        ),
      ),
    );
  }
}


