import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Views/Component/AccountOptionCard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multivender_ecommerce_app/Views/Component/Header.dart';
import '../MyColors.dart';


class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double statusBar = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: EdgeInsets.only(top: statusBar.h,left: 28.w,right: 28.w),
        child: Column(
          children: [
            Header(header: "Profile"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AccountOptionCard(icon: Icons.move_to_inbox_sharp,text: "Orders",destination: "/OrdersPage",),
                AccountOptionCard(icon: Icons.lock_outline,text: "Password",),
              ],
            ),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AccountOptionCard(icon: Icons.location_on_outlined,text: "Location",),
                AccountOptionCard(icon: Icons.credit_card_outlined,text: "Cards",),
              ],
            )
          ],
        ),
      ),
    );
  }
}
