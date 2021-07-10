import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
