import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Views/Component/MainButton.dart';

import '../MyColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        width: 375.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 300.h,),
            Text(
              "Coming Soon...",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(height: 20.h,),
            MainButton(text: "Go Back", btnFunction: (){
              Navigator.pop(context);
            })
          ],
        ),
      ),
    );
  }
}
