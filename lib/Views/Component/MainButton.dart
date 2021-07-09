import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multivender_ecommerce_app/Controllers/ThemeController.dart';
import 'package:provider/provider.dart';

class MainButton extends StatelessWidget {
  MainButton({
    @required this.text,
    @required this.btnFunction,
  });

  final String text;
  final Function btnFunction;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeController>(context);
    return InkWell(
      onTap: btnFunction,
      child: Container(
        height: 66.h,
        width: 320.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                themeProvider.gradColor1,
                themeProvider.gradColor2,
                themeProvider.gradColor3,
                themeProvider.gradColor4,
              ],
            )
        ),
        child: Center(
          child: Text(
            text,
            style: themeProvider.buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
