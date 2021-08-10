import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multivender_ecommerce_app/Controllers/UserCredController.dart';
import 'package:multivender_ecommerce_app/Models/ProductModel.dart';
import 'package:multivender_ecommerce_app/Views/Component/Header.dart';
import 'package:multivender_ecommerce_app/Views/Component/MainCard.dart';
import 'package:multivender_ecommerce_app/Views/Component/MyTextField.dart';
import 'package:provider/provider.dart';
import 'package:multivender_ecommerce_app/Controllers/SearchResultsDisplayController.dart';

import '../MyColors.dart';

class FavouritesPage extends StatefulWidget {
  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {

  TextEditingController _searchTextController = TextEditingController();
  List<ProductModel> favData;
  List<MainCard> favCards;

  void initState() {
    favData = Provider.of<UserCredController>(context, listen: false).userModel.favourite;
    Provider.of<SearchResultDisplayController>(context, listen: false).reset();
    favCards =  List.generate(favData.length, (index) {
      return MainCard(
        marginRight: 0,
        productModel: favData[index],
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double statusBar = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: statusBar.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 28.w, right: 28.w),
                child: Column(
                  children: [
                    Header(
                      header: "Favourites",
                    ),
                    MyTextFiled(
                      textController: _searchTextController,
                      myIcon: Icons.search,
                      hint: "Search",
                      focus: false,
                      screenName: "Favourite",
                      search: true,
                      searchList: favCards,
                        isPassword: false

                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                  ],
                ),
              ),
              Provider.of<SearchResultDisplayController>(context).screenName == "Favourite" && Provider.of<SearchResultDisplayController>(context).isFound == true ?
              Container(
                height: 410.h,
                width: 375.w,
                padding: EdgeInsets.only(bottom: 9.h,),
                child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  padding: EdgeInsets.only(left: 28.w,right: 28.w,bottom: 100.h),
                  children: List.generate(Provider.of<SearchResultDisplayController>(context).results.length, (index) {
                    return Provider.of<SearchResultDisplayController>(context).results[index];
                  }),
                ),
              )
                  :
              Container(
                height: 410.h,
                width: 375.w,
                padding: EdgeInsets.only(
                  bottom: 9.h,
                ),
                child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  padding:
                      EdgeInsets.only(left: 28.w, right: 28.w, bottom: 20.h),
                  children: favCards
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
