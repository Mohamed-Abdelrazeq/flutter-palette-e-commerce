import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Controllers/ThemeController.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multivender_ecommerce_app/Views/Component/MainCard.dart';
import 'package:provider/provider.dart';

class MyTextFiled extends StatefulWidget {

  MyTextFiled({
    @required this.textController,
    @required this.myIcon,
    @required this.hint,
    @required this.focus,
    @required this.searchList,
  });

  final TextEditingController textController;
  final String hint;
  final IconData myIcon;
  final bool focus;
  final List<Widget> searchList;

  @override
  _MyTextFiledState createState() => _MyTextFiledState();
}

class _MyTextFiledState extends State<MyTextFiled> {

  Color iconColor = ThemeController().myWhite60;
  List<MainCard> searchEngine({List searchList,String keyWord}){
    List<MainCard> output = [];


    searchList.forEach((e) => {
      if(e.productModel.name.toUpperCase().contains(keyWord.toUpperCase())){
        output.add(e)
      }
    });
    print(output);
    return output;
  }

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
              autofocus: widget.focus,
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
                searchEngine(
                  keyWord: widget.textController.text,
                  searchList: widget.searchList.sublist(1),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
