import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Models/ProductModel.dart';
import 'package:multivender_ecommerce_app/Views/Component/HeaderWithBack.dart';
import 'package:multivender_ecommerce_app/Views/Component/MainButton.dart';
import 'package:multivender_ecommerce_app/Views/Component/MainCard.dart';
import 'package:multivender_ecommerce_app/Views/FutureReturn/Loading.dart';
import 'package:multivender_ecommerce_app/Views/FutureReturn/SomethingWentWrong.dart';
import 'package:multivender_ecommerce_app/Views/MyColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double statusBar = MediaQuery.of(context).padding.top;
    return  FutureBuilder(
        future: ProductModel().readAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return SomethingWentWrong();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              backgroundColor: bgColor,
              body: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding:
                      EdgeInsets.only(top: statusBar.h, right: 28.w, left: 28.w),
                      child: Column(
                        children: [
                          HeaderWithBack(header: "Products"),
                          GridView.count(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            padding: EdgeInsets.only(bottom: 100.h),
                            children: List.generate(snapshot.data.length , (index) {
                              print(snapshot.data.length );
                              return MainCard(
                                marginRight: 0,
                                productModel: snapshot.data[index],
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20.h,
                    child: MainButton(text: "Categories", btnFunction: (){
                      Navigator.pushNamed(context, "/Categories");
                    }),
                  ),
                ],
              ),
            );
          }
          return Loading();
        },
      );
  }
}
