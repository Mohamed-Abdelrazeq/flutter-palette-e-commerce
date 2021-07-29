import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multivender_ecommerce_app/Views/MyColors.dart';

class BNBar extends StatefulWidget {
  @override
  _BNBarState createState() => _BNBarState();
}

class _BNBarState extends State<BNBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: widgetColor
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.home_outlined,
              color: Colors.white,
              size: 25.r,
            ),
            Icon(
              Icons.favorite_border,
              color: white60,
              size: 25.r,
            ),
            Icon(
              Icons.shopping_cart_outlined,
              color: white60,
              size: 25.r,
            ),
            Icon(
              Icons.account_circle_outlined,
              color: white60,
              size: 25.r,
            ),
          ],
        ),
      ),
    );
  }
}
