import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Views/MyColors.dart';

void flashBar({
  @required title,
  @required message,
  @required context,
}) =>
    Flushbar(
      title: title,
      message: message,
      backgroundColor: widgetColor,
      duration: Duration(seconds: 3),
    )..show(context);
