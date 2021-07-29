import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Views/Component/BNBar.dart';
import 'package:multivender_ecommerce_app/Views/MyColors.dart';
import 'package:multivender_ecommerce_app/Views/Screens/AccountPage.dart';
import 'package:multivender_ecommerce_app/Views/Screens/CartPage.dart';
import 'package:multivender_ecommerce_app/Views/Screens/HomePage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'FavourtitesPage.dart';

class NavPage extends StatefulWidget {
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            children: [
              HomePage(),
              FavouritesPage(),
              CartPage(),
              AccountPage(),
            ],
          ),
          Positioned(
            child: BNBar(),
            bottom: 20.h,
          ),
        ],
      ),
    );
  }
}
