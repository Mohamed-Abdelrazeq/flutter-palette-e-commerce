import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Controllers/UserCredController.dart';
import 'package:multivender_ecommerce_app/Views/Component/MainButton.dart';
import 'package:multivender_ecommerce_app/Views/Component/MyTextField.dart';
import 'package:multivender_ecommerce_app/Views/MyColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddPhoneNumber extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double statusBar = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: EdgeInsets.only(left: 28.w,top: (statusBar+30).h,right: 28.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Phone Number",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 28.sp
              ),
            ),
            SizedBox(height: 20.h),
            MyTextFiled(textController: phoneController, myIcon: Icons.phone, hint: "phone number",focus: true,search: false,isPassword: false,),
            Spacer(),
            MainButton(text: "Save", btnFunction: () async {
              await Provider.of<UserCredController>(context,listen: false).setPhone(phoneController.text);
              Navigator.pop(context);
            }),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
