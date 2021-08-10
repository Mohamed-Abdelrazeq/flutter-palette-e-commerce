import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Models/ProductModel.dart';
import 'package:multivender_ecommerce_app/Views/Component/Header.dart';
import 'package:multivender_ecommerce_app/Views/Component/MainCard.dart';
import 'package:multivender_ecommerce_app/Views/FutureReturn/Loading.dart';
import 'package:multivender_ecommerce_app/Views/FutureReturn/SomethingWentWrong.dart';
import 'package:multivender_ecommerce_app/Views/MyColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ACategory extends StatelessWidget {

  const ACategory({
    @required this.name,
});

  final String name;

  @override
  Widget build(BuildContext context) {
    double statusBar = MediaQuery.of(context).padding.top;
    return  FutureBuilder(
      future: ProductModel().readCategoryProducts(name),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            backgroundColor: bgColor,
            body: Padding(
              padding: EdgeInsets.only(top: statusBar.h,left: 28.w,right: 28.w),
              child: Column(
                children: [
                  Header(header: name),
                  Container(
                    width: 375.w,
                    height: 608.h - (statusBar.h*1.5),
                    child:  GridView.count(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      padding: EdgeInsets.only(bottom: 100.h),
                      children: List.generate(snapshot.data.length, (index) {
                        return MainCard(marginRight: 0, productModel: snapshot.data[index]);
                      }),
                    ),
                  ),
                ],
              ),
            ),
          );

        }
        return Loading();
      },
    );

  }
}
