import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multivender_ecommerce_app/Views/MyColors.dart';

class MainCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.w),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 150.r,
            width: 150.r,
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: widgetColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Container(
              height: 150.r,
              width: 150.r,
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/Cactus.png")),
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ),
          Positioned(
            bottom: -5.r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: widgetColor,
                  ),
                  child: Text(
                    "Plants",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontSize: 14.sp
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
