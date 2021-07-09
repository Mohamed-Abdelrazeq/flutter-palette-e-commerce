import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Controllers/ThemeController.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key key,
    @required this.themeProvider,
  }) : super(key: key);

  final ThemeController themeProvider;

  @override
  Widget build(BuildContext context) {
    return Text(
      "Palette",
      style: themeProvider.logoTextStyle,
    );
  }
}
