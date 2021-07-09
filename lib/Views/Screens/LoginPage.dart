import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Controllers/ThemeController.dart';
import 'package:multivender_ecommerce_app/Views/Component/Logo.dart';
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
      body: Container(
        child: SingleChildScrollView(
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
                MyTextFiled(textController: widget.email,),
                SizedBox(height: 10.h,),
                MyTextFiled(textController: widget.email,),
                SizedBox(height: 136.h,),
                MainButton(text: "Login",btnFunction: (){
                  Navigator.pushNamed(context, "/RegisterPage");
                },),
                SizedBox(height: 25.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyTextFiled extends StatefulWidget {

  MyTextFiled({
    @required this.textController,
});

  final TextEditingController textController;

  @override
  _MyTextFiledState createState() => _MyTextFiledState();
}

class _MyTextFiledState extends State<MyTextFiled> {

  Color iconColor = ThemeController().myWhite60;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeController>(context);
    return Container(
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
      padding: EdgeInsets.symmetric(vertical: 18.h,horizontal: 18.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Icon(Icons.mail_outline,color: iconColor,size: 24.w,),
          SizedBox(width: 22.w),
         Expanded(
           child: TextField(
             controller: widget.textController,
             style: themeProvider.textFieldTextStyle.apply(color: themeProvider.myWhite),
             cursorHeight: 20.h,
             cursorColor: themeProvider.myWhite60,
             decoration: InputDecoration(
               hintText: "email",
               hintStyle: themeProvider.textFieldTextStyle,
               focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: themeProvider.myWhite)),
               enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: themeProvider.myWhite60)),
             ),
             onTap: (){
               setState(() {
                 iconColor = themeProvider.myWhite;
               });
             },
             onChanged: (v){
             //  TODO
             },
           ),
         )
        ],
      ),
    );
  }
}

