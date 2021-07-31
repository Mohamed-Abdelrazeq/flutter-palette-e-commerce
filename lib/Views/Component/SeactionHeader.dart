import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SectionHeader extends StatelessWidget {
  const SectionHeader({
    @required this.header,
    @required this.seeAllDes,
  });

  final String header;
  final String seeAllDes;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            header,
            style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, seeAllDes);
            },
            child: Text(
              "See All",
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.white
              ),
            ),
          ),
        ],
      ),
    );
  }
}


