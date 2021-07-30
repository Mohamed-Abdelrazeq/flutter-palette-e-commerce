import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Views/MyColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountOptionCard extends StatelessWidget {
  const AccountOptionCard({
    @required this.icon,
    @required this.text,
    @required this.destination,
  });

  final IconData icon;
  final String text;
  //todo
  final String destination;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.r,
      height: 150.r,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: widgetColor,
          borderRadius: BorderRadius.circular(20.r)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon,size: 50.r,color: white60, ),
          Text(
            text,
            style: TextStyle(
                color: white60,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400
            ),
          )
        ],
      ),
    );
  }
}
