import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multivender_ecommerce_app/Controllers/ThemeController.dart';
import 'package:provider/provider.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';


import '../Constants.dart';

class SecButton extends StatelessWidget {
  SecButton({
    @required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeController>(context);
    return OutlineGradientButton(
      child: Container(
        height: 66.h,
        width: 320.w,
        child: Center(
          child: Text(
            text,
            style: themeProvider.buttonTextStyle,
          ),
        ),
      ),
      padding: EdgeInsets.zero,
      gradient: LinearGradient(
        colors: [
          themeProvider.gradColor1,
          themeProvider.gradColor2,
          themeProvider.gradColor3,
          themeProvider.gradColor4,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      strokeWidth: 1,
      radius: Radius.circular(20),
    );
  }
}
