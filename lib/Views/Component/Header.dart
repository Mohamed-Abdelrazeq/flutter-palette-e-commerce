import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multivender_ecommerce_app/Views/MyColors.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40.r,
          height: 40.r,
          decoration: BoxDecoration(
              color: widgetColor,
              borderRadius: BorderRadius.circular(18.r),
              image: DecorationImage(
                  image: AssetImage("")
              )
          ),
        ),
        Text(
          "Welcome Eleven",
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white
          ),
        ),
        Container(
          width: 40.r,
          height: 40.r,
          decoration: BoxDecoration(
            color: widgetColor,
            borderRadius: BorderRadius.circular(18.r),

          ),
          child: Center(child: Icon(Icons.notifications_none,size: 20.r,color: Colors.white.withOpacity(.6),)),
        ),
      ],
    );
  }
}
