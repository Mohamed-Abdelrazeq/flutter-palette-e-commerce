import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Controllers/LocationController.dart';
import 'package:multivender_ecommerce_app/Controllers/ThemeController.dart';
import 'package:multivender_ecommerce_app/Controllers/UserCredController.dart';
import 'package:multivender_ecommerce_app/Services/Auth.dart';
import 'package:multivender_ecommerce_app/Views/Component/LoginViaCard.dart';
import 'package:multivender_ecommerce_app/Views/Component/Logo.dart';
import 'package:multivender_ecommerce_app/Views/Component/MyTextField.dart';
import 'package:multivender_ecommerce_app/Views/Component/Slogan.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multivender_ecommerce_app/Views/Component/MainButton.dart';

import '../MyColors.dart';

class LoginPage extends StatefulWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              SizedBox(
                height: 30.h,
              ),
              MyTextFiled(
                textController: widget.email,
                hint: "email",
                myIcon: Icons.mail_outline,
                focus: false,
                search: false,
              ),
              SizedBox(
                height: 10.h,
              ),
              MyTextFiled(
                textController: widget.password,
                hint: "password",
                myIcon: Icons.lock_outline,
                focus: false,
                search: false,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("not a user ?",
                      style: themeProvider.h4TextStyle
                          .apply(color: themeProvider.myWhite60)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "/RegisterPage");
                    },
                    child: Text(
                      " Register",
                      style: themeProvider.h4TextStyle
                          .apply(color: themeProvider.myWhite),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  LoginViaCard(imgPath: "images/google-logo.png",func: ()async{
                    Provider.of<UserCredController>(context,listen: false).setUserCredential(
                    await Auth().signInWithGoogle(
                      lng : Provider.of<LocationController>(context,listen: false).getCurrentLocationLng,
                      lat : Provider.of<LocationController>(context,listen: false).getCurrentLocationLat,
                    ));
                    if(Provider.of<UserCredController>(context,listen: false).userModel != null){
                      Navigator.pushNamed(context, "/NavPage");
                    }
                  },),
                  SizedBox(width: 30.w),
                  LoginViaCard(imgPath: "images/facebook-logo.png",func: ()async{
                    Provider.of<UserCredController>(context,listen: false).setUserCredential(
                    await Auth().signInWithFacebook(
                      lng : Provider.of<LocationController>(context,listen: false).getCurrentLocationLng,
                      lat : Provider.of<LocationController>(context,listen: false).getCurrentLocationLat,
                    ));
                    if(Provider.of<UserCredController>(context,listen: false).userModel != null){
                      Navigator.pushNamed(context, "/NavPage");
                    }
                  },),
                ],
              ),
              SizedBox(
                height: 80.h,
              ),
              MainButton(
                text: "Login",
                btnFunction: () async {
                  Provider.of<UserCredController>(context,listen: false).setUserCredential(
                      await Auth().login(
                        mail: widget.email.text,
                        password: widget.password.text,
                      )
                  );
                  if(Provider.of<UserCredController>(context,listen: false).userModel != null){
                  Navigator.pushNamed(context, "/NavPage");
                  }
                },
              ),
              SizedBox(
                height: 25.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
