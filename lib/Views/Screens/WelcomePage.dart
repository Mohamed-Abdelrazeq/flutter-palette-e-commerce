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
    var themeProvider = Provider.of<ThemeController>(context);
    return Scaffold(
      body: Container(
        width: 375.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Palette",
              style: themeProvider.logoTextStyle,
            ),
            Text(
              'here you can find all\nabout art',
              style: themeProvider.sloganTextStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 136.h,),
            MainButton(text: "Get Started",btnFunction: (){
              Navigator.pushNamed(context, "/RegisterPage");
            },),
            SizedBox(height: 10.h,),
            SecButton(text: "Login",btnFunction: (){
              Navigator.pushNamed(context, "/LoginPage");
            },),
            SizedBox(height: 25.h,),
          ],
        ),
      ),
    );
  }
}
