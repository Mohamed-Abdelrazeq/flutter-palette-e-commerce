import 'package:flutter/material.dart';
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

  PageController _pageController =  PageController(
    initialPage: 0,
    keepPage: true,
  );
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (value){
              setState(() {
                _currentPageIndex = value;
              });
            },
            controller: _pageController,
            children: [
              HomePage(),
              FavouritesPage(),
              CartPage(),
              AccountPage(),
            ],
          ),
          Positioned(
            child: Container(
              width: 320.w,
              height: 60.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: widgetColor
              ),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _currentPageIndex == 0 ? Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                      size: 25.r,
                    ) : GestureDetector(
                      onTap: (){
                        _pageController.animateToPage(0, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                      },
                      child: Icon(
                        Icons.home_outlined,
                        color: white60,
                        size: 25.r,
                      ),
                    ) ,
                    _currentPageIndex == 1 ? Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 25.r,
                    ) : GestureDetector(
                      onTap: (){
                        _pageController.animateToPage(1, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                      },
                      child: Icon(
                        Icons.favorite_border,
                        color: white60,
                        size: 25.r,
                      ),
                    ) ,
                    _currentPageIndex == 2 ? Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                      size: 25.r,
                    ) : GestureDetector(
                      onTap: (){
                        _pageController.animateToPage(2, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                      },
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: white60,
                        size: 25.r,
                      ),
                    ) ,
                    _currentPageIndex == 3 ? Icon(
                      Icons.account_circle_outlined,
                      color: Colors.white,
                      size: 25.r,
                    ) : GestureDetector(
                      onTap: (){
                        _pageController.animateToPage(3, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                      },
                      child: Icon(
                        Icons.account_circle_outlined,
                        color: white60,
                        size: 25.r,
                      ),
                    ) ,


                  ],
                ),
              ),
            ),
            bottom: 20.h,
          ),
        ],
      ),
    );
  }
}
