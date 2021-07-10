import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Controllers/ThemeController.dart';
import 'package:multivender_ecommerce_app/Views/Component/Logo.dart';
import 'package:multivender_ecommerce_app/Views/Component/MyTextField.dart';
import 'package:multivender_ecommerce_app/Views/Component/Slogan.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multivender_ecommerce_app/Views/Component/MainButton.dart';


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
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Text(
                      "not a user ?",
                      style: themeProvider.h4TextStyle.apply(color: themeProvider.myWhite60)
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, "/RegisterPage");
                    },
                    child: Text(
                      " Register",
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
                  LoginViaCard(),
                  SizedBox(width: 30.w),
                  LoginViaCard(),
                  SizedBox(width: 30.w),
                  LoginViaCard(),
                ],
              ),
              SizedBox(height: 80.h,),
              MainButton(text: "Login",btnFunction: (){
                Navigator.pushNamed(context, "/RegisterPage");
              },),
              SizedBox(height: 25.h,),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginViaCard extends StatelessWidget {
   LoginViaCard({
     @required this.func,
     @required this.imgPath,
  });

   final String imgPath;
   final Function func;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Container(
        width: 50.sp,
        height: 50.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Color(0x3f000000),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
          color: Colors.white,
        ),
        padding: EdgeInsets.all(7.sp),
        //TODO : replace with image and us imgPath
        child: FlutterLogo(size: 35),
      ),
    );
  }
}


