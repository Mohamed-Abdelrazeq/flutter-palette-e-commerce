import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Controllers/ThemeController.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyTextFiled extends StatefulWidget {

  MyTextFiled({
    @required this.textController,
    @required this.myIcon,
    @required this.hint,
  });

  final TextEditingController textController;
  final String hint;
  final IconData myIcon;

  @override
  _MyTextFiledState createState() => _MyTextFiledState();
}

class _MyTextFiledState extends State<MyTextFiled> {

  Color iconColor = ThemeController().myWhite60;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeController>(context);
    return Container(
      width: 320.w,
      height: 66.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Color(0x3f000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
        color: themeProvider.cardColor,
      ),
      padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 18.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Icon(widget.myIcon,color: iconColor,size: 24.w,),
          SizedBox(width: 22.w),
          Expanded(
            child: TextField(
              controller: widget.textController,
              style: themeProvider.textFieldTextStyle.apply(color: themeProvider.myWhite),
              cursorHeight: 20.h,
              cursorColor: themeProvider.myWhite60,
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: themeProvider.textFieldTextStyle,
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: themeProvider.myWhite)),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: themeProvider.myWhite60)),
              ),
              onTap: (){
                setState(() {
                  iconColor = themeProvider.myWhite;
                });
              },
              onChanged: (v){
                //  TODO
              },
            ),
          )
        ],
      ),
    );
  }
}
