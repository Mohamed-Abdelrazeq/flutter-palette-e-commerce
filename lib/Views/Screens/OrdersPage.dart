import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Controllers/UserCredController.dart';
import 'package:multivender_ecommerce_app/Models/OrderModel.dart';
import 'package:multivender_ecommerce_app/Views/Component/HeaderWithBack.dart';
import 'package:multivender_ecommerce_app/Views/FutureReturn/Loading.dart';
import 'package:multivender_ecommerce_app/Views/FutureReturn/SomethingWentWrong.dart';
import 'package:multivender_ecommerce_app/Views/MyColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double statusBar = MediaQuery.of(context).padding.top;
    return FutureBuilder(
      future: OrderModel().readOrdersByUserUID(
          Provider.of<UserCredController>(context).userModel.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            backgroundColor: bgColor,
            body: Padding(
              padding: EdgeInsets.only(top: statusBar, left: 28.w, right: 28.w),
              child: Column(
                children: [
                  HeaderWithBack(header: "OrdersPage"),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 20.h),
                          padding: EdgeInsets.all(20.r),
                          decoration: BoxDecoration(
                            color: widgetColor,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Order NO.${index + 1}",
                                    style: TextStyle(color: Colors.white,fontSize: 18.sp),
                                  )
                                ],
                              ),
                              SizedBox(height: 10.h,),
                              ...List.generate(
                                snapshot.data[index].products.length,
                                (innerIndex) {
                                  return Text(
                                    "Product No.${index + 1} : ${snapshot.data[index].products[innerIndex].name}",
                                    style: TextStyle(color: Colors.white,fontSize: 16.sp),
                                  );
                                },
                              ),
                              Text(
                                "Status : ${snapshot.data[index].status}",
                                style: TextStyle(color: white60),
                              ),
                              Text(
                                "Count : ${snapshot.data[index].products.length}",
                                style: TextStyle(color: white60),
                              ),
                              Text(
                                "Ordering Date : ${snapshot.data[index].orderingDate}",
                                style: TextStyle(color: white60),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
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
