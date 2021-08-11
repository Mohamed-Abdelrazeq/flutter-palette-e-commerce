import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Controllers/LocationController.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multivender_ecommerce_app/Views/Component/MainButton.dart';
import 'package:provider/provider.dart';
import '../MyColors.dart';

class GetLocation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Provider.of<LocationController>(context).getCurrentCoordinates();
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        width: 375.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 300.h,),
            Text(
              "Location Updated",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700
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
