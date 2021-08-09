import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:multivender_ecommerce_app/Models/ProductModel.dart';
import 'package:multivender_ecommerce_app/Views/Component/Header.dart';
import 'package:multivender_ecommerce_app/Views/Component/MainCard.dart';
import 'package:multivender_ecommerce_app/Views/Component/MainCategoryCard.dart';
import 'package:multivender_ecommerce_app/Views/Component/MyTextField.dart';
import 'package:multivender_ecommerce_app/Views/Component/SeactionHeader.dart';
import 'package:multivender_ecommerce_app/Views/FutureReturn/Loading.dart';
import 'package:multivender_ecommerce_app/Views/FutureReturn/SomethingWentWrong.dart';
import 'package:multivender_ecommerce_app/Views/MyColors.dart';
import 'package:provider/provider.dart';
import 'package:multivender_ecommerce_app/Controllers/SearchResultsDisplayController.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _myCards = [
    SizedBox(
      width: 28.w,
    )
  ];
  void _dataHandler(List<ProductModel> modelList) {
    for (var i = 0; i < modelList.length; i++) {
      _myCards.add(MainCard(marginRight: 20.w, productModel: modelList[i]));
    }
  }

  TextEditingController _searchTextController = TextEditingController();

  @override
  void initState() {
    print("Home Called");
    Provider.of<SearchResultDisplayController>(context,listen: false).reset();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(bgColor);
    double statusBar = MediaQuery.of(context).padding.top;
    return FutureBuilder(
      future: ProductModel().readAllProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return SomethingWentWrong();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          if (_myCards.length == 1) {
            _dataHandler(snapshot.data);
          }
            return Scaffold(
              backgroundColor: bgColor,
              body: Padding(
                padding: EdgeInsets.only(top: statusBar.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 28.w, right: 28.w),
                        child: Column(
                          children: [
                            Header(
                              header: "Welcome Eleven",
                            ),
                            MyTextFiled(
                              textController: _searchTextController,
                              myIcon: Icons.search,
                              hint: "Search",
                              focus: false,
                              searchList: _myCards,
                              search: true,
                              screenName: "Home",
                          ),
                          SizedBox(
                            height: 22.h,
                          ),
                        ],
                      ),
                    ),
                    Provider.of<SearchResultDisplayController>(context).screenName == "Home" && Provider.of<SearchResultDisplayController>(context).isFound == true ?
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
                    : Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 28.w, right: 28.w),
                          child: SectionHeader(
                            header: "Categories",
                            seeAllDes: "/Categories",
                          ),
                        ),
                        Container(
                          height: 150.h,
                          width: 375.w,
                          margin: EdgeInsets.only(right: 8.w),
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: [
                              SizedBox(
                                width: 28.w,
                              ),
                              MainCategoryCard(
                                  marginRight: 20,
                                  cate: "Crafts",
                                  imgPath: "images/cate/crafts.jpg"),
                              MainCategoryCard(
                                  marginRight: 20,
                                  cate: "Knit",
                                  imgPath: "images/cate/knit.jpg"),
                              MainCategoryCard(
                                  marginRight: 20,
                                  cate: "Art",
                                  imgPath: "images/cate/art.jpg"),
                              MainCategoryCard(
                                  marginRight: 20,
                                  cate: "Plants",
                                  imgPath: "images/cate/Cactus.png"),
                              MainCategoryCard(
                                  marginRight: 20,
                                  cate: "Clothes",
                                  imgPath: "images/cate/clothes.jpg"),
                              MainCategoryCard(
                                  marginRight: 20,
                                  cate: "Accessories",
                                  imgPath: "images/cate/accec.jpg"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 28.w, right: 28.w),
                          child: SectionHeader(
                            header: "Products",
                            seeAllDes: "/Products",
                          ),
                        ),
                        Container(
                          height: 150.h,
                          width: 375.w,
                          margin: EdgeInsets.only(right: 8.w),
                          child: ListView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: _myCards),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
        return Loading();
      },
    );
  }
}
