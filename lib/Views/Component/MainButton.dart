import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multivender_ecommerce_app/Controllers/ThemeController.dart';
import 'package:provider/provider.dart';

import '../Constants.dart';

class MainButton extends StatelessWidget {
  MainButton({
    @required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    var colorProvider = Provider.of<ThemeController>(context);
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(colorProvider.mainColor),
        foregroundColor: MaterialStateProperty.all<Color>(colorProvider.myWhite),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered))
              return Colors.white.withOpacity(0.1);
            if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.pressed))
              return Colors.white.withOpacity(0.25);
            return null;
          },
        ),
// padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 80.w,vertical: 15.h)),
        minimumSize: MaterialStateProperty.all(Size(300.w, 60.h)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(myRadius)),
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16.sp),
      ),
    );
  }
}
