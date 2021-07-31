import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multivender_ecommerce_app/Views/MyColors.dart';

class HeaderWithBack extends StatelessWidget {
  const HeaderWithBack({
    @required this.header,
  }) ;

  final String header;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 22.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              width: 40.r,
              height: 40.r,
              decoration: BoxDecoration(
                  color: widgetColor,
                  borderRadius: BorderRadius.circular(18.r),
              ),
              child: Icon(Icons.chevron_left,color: white60,size: 20.r,),
            ),
          ),
          Text(
            header,
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
            child: Center(child: Icon(Icons.notifications_none,size: 20.r,color: white60,)),
          ),
        ],
      ),
    );
  }
}
