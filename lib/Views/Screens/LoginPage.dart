import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Controllers/ThemeController.dart';
import 'package:multivender_ecommerce_app/Views/Component/Logo.dart';
import 'package:multivender_ecommerce_app/Views/Component/Slogan.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multivender_ecommerce_app/Views/Component/MainButton.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            Logo(themeProvider: themeProvider),
            Slogan(themeProvider: themeProvider),


            Container(
              width: 320.w,
              height: 66.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
                color: themeProvider.cardColor,
              ),
              padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 24.h, bottom: 24.h, ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Icon(Icons.mail_outline,color: themeProvider.myWhite60,size: 20.w,),
                  SizedBox(width: 22.w),
                  Text(
                    "email",
                    style: themeProvider.textFieldTextStyle
                  ),
                ],
              ),
            ),


            SizedBox(height: 136.h,),
            MainButton(text: "Login",btnFunction: (){
              Navigator.pushNamed(context, "/RegisterPage");
            },),
            SizedBox(height: 25.h,),
          ],
        ),
      ),
    );
  }
}

