import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multivender_ecommerce_app/Controllers/LocationController.dart';
import 'package:multivender_ecommerce_app/Controllers/ThemeController.dart';
import 'package:multivender_ecommerce_app/Controllers/UserCredController.dart';
import 'package:multivender_ecommerce_app/Services/Auth.dart';
import 'package:multivender_ecommerce_app/Views/Component/LoginViaCard.dart';
import 'package:multivender_ecommerce_app/Views/Component/Logo.dart';
import 'package:multivender_ecommerce_app/Views/Component/MainButton.dart';
import 'package:multivender_ecommerce_app/Views/Component/MyTextField.dart';
import 'package:multivender_ecommerce_app/Views/Component/Slogan.dart';
import 'package:provider/provider.dart';

import '../MyColors.dart';

class RegisterPage extends StatefulWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phone = TextEditingController();
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeController>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Container(
          width: 375.w,
          height: 667.h,
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
              SizedBox(height: 30.h,),
              MyTextFiled(textController: widget.email,hint: "email",myIcon: Icons.mail_outline,),
              SizedBox(height: 10.h,),
              MyTextFiled(textController: widget.password,hint: "password",myIcon: Icons.lock_outline,),
              SizedBox(height: 10.h,),
              MyTextFiled(textController: widget.phone,hint: "phone",myIcon: Icons.phone,),
              SizedBox(height: 10.h,),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Text(
                      "already a user ?",
                      style: themeProvider.h4TextStyle.apply(color: themeProvider.myWhite60)
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, "/LoginPage");
                    },
                    child: Text(
                      " Login",
                      style: themeProvider.h4TextStyle.apply(color: themeProvider.myWhite),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  LoginViaCard(imgPath: "images/google-logo.png",func: ()async{
                    await Auth().signInWithGoogle(
                      lng : Provider.of<LocationController>(context,listen: false).getCurrentLocationLng,
                      lat : Provider.of<LocationController>(context,listen: false).getCurrentLocationLat,
                    );
                    if(Provider.of<UserCredController>(context,listen: false).userModel != null){
                      Navigator.pushNamed(context, "/NavPage");
                    }
                  },),
                  SizedBox(width: 30.w),
                  LoginViaCard(imgPath: "images/facebook-logo.png",func: ()async{
                    await Auth().signInWithFacebook(
                      lng : Provider.of<LocationController>(context,listen: false).getCurrentLocationLng,
                      lat : Provider.of<LocationController>(context,listen: false).getCurrentLocationLat,
                    );
                    if(Provider.of<UserCredController>(context,listen: false).userModel != null){
                      Navigator.pushNamed(context, "/NavPage");
                    }
                  },),
                ],
              ),
              SizedBox(height: 60.h,),
              MainButton(text: "Register",btnFunction: ()async{
                await Auth().register(
                    mail: widget.email.text,
                    phone: widget.phone.text,
                    password: widget.password.text,
                );
                if(Provider.of<UserCredController>(context,listen: false).userModel != null){
                  Navigator.pushNamed(context, "/NavPage");
                }
              },),
              SizedBox(height: 25.h,),
            ],
          ),
        ),
      ),
    );
  }
}
