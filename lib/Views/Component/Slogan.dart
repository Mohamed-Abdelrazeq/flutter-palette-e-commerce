import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Controllers/ThemeController.dart';


class Slogan extends StatelessWidget {
  const Slogan({
    Key key,
    @required this.themeProvider,
  }) : super(key: key);

  final ThemeController themeProvider;

  @override
  Widget build(BuildContext context) {
    return Text(
      'here you can find all\nabout art',
      style: themeProvider.sloganTextStyle,
      textAlign: TextAlign.center,
    );
  }
}
