import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:multivender_ecommerce_app/Views/MyColors.dart';


class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: SpinKitRotatingCircle(
        color: Colors.redAccent,
        size: 50.0,
      ),
    );
  }
}
