import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Views/Component/MainButton.dart';
import 'package:multivender_ecommerce_app/Views/Component/SecButton.dart';
import 'package:multivender_ecommerce_app/Views/MyColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: 375.w,
                  height: 335.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50.r),
                          bottomLeft: Radius.circular(50.r)),
                      image: DecorationImage(
                        image: AssetImage("images/Cactus.png"),
                        fit: BoxFit.cover,
                      )),
                ),
                Positioned(
                  bottom: 10.h,
                  child: TextContainer(content: Text(
                    "Golden Barrel Cactus",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
                )
              ],
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextContainer(content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.monetization_on,color: white60,size: 20.r,),
                          SizedBox(width: 10.w,),
                          Text(
                            "200.P",
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  TextContainer(content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white.withOpacity(.8),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )),
                  SizedBox(height: 20.h,),
                  MainButton(text: "Order Now", btnFunction: (){}),
                  SizedBox(height: 10.h,),
                  SecButton(text: "Add to Cart", btnFunction: (){}),
                  SizedBox(height: 20.h,),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class TextContainer extends StatelessWidget {

  TextContainer({
    @required this.content,
  });

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
      decoration: BoxDecoration(
          color: widgetColor,
          borderRadius: BorderRadius.circular(20.r)
      ),
      child: content
    );
  }
}

