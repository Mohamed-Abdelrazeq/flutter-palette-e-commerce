import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeController with ChangeNotifier {

  Color gradColor1 = Color(0xff2495D4);
  Color gradColor2 = Color(0xffAF28D1);
  Color gradColor3 = Color(0xffD36A08);
  Color gradColor4 = Color(0xffFFD600);

  Color myWhite = Color(0xffFFFFFF);

  TextStyle buttonTextStyle = TextStyle(
    fontSize: 18.sp,
    fontFamily: "Roboto",
    color: Colors.white,

  );
}

