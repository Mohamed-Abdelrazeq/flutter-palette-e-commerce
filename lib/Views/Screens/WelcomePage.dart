import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Controllers/ThemeController.dart';
import 'package:multivender_ecommerce_app/Views/Component/MainButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multivender_ecommerce_app/Views/Component/SecButton.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    var colorProvider = Provider.of<ThemeController>(context);
    return Scaffold(
      backgroundColor: colorProvider.bgColor,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 40.h),
        width: 375.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/welcomeBg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Palette",
              style: TextStyle(
                fontSize: 32.sp,
                color: colorProvider.myWhite,
                fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(height: 10.h,),
            Text(
              "Where you can find all the ART\nYou've been looking for!",
              style: TextStyle(
                  fontSize: 14.sp,
                  color: colorProvider.myWhite,
                  fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h,),
            MainButton(text: "Get Started",),
            SizedBox(height: 10.h,),
            SecButton(text: "Login"),
          ],
        ),
      ),
    );
  }
}
