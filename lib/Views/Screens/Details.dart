import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Controllers/CurrentProductRateController.dart';
import 'package:multivender_ecommerce_app/Controllers/UserCredController.dart';
import 'package:multivender_ecommerce_app/Models/ProductModel.dart';
import 'package:multivender_ecommerce_app/Models/UserModel.dart';
import 'package:multivender_ecommerce_app/Views/Component/MainButton.dart';
import 'package:multivender_ecommerce_app/Views/Component/SecButton.dart';
import 'package:multivender_ecommerce_app/Views/MyColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  Details({
    @required this.productModel,
  });

  final ProductModel productModel;

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Provider.of<CurrentProductRateController>(context,listen: false).setCurrentRate(rate: 0);
        Navigator.pop(context);
        return null;
      },
      child: Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: 375.w,
                    height: 335.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50.r),
                            bottomLeft: Radius.circular(50.r)),
                        image: DecorationImage(
                          image: NetworkImage(widget.productModel.image),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Positioned(
                    bottom: 10.h,
                    child: TextContainer(
                        content: Text(
                      widget.productModel.name,
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextContainer(
                            content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.monetization_on,
                              color: white60,
                              size: 20.r,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "${widget.productModel.price.toInt()} .P",
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextContainer(
                        content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.productModel.description,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white.withOpacity(.8),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RateCard(rate: 1,productModel: widget.productModel,),
                        RateCard(rate: 2,productModel: widget.productModel,),
                        RateCard(rate: 3,productModel: widget.productModel,),
                        RateCard(rate: 4,productModel: widget.productModel,),
                        RateCard(rate: 5,productModel: widget.productModel,),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    MainButton(
                        text: "Add to Favourite",
                        btnFunction: () {
                          Provider.of<UserCredController>(context, listen: false)
                              .userModel
                              .addToFavourite(widget.productModel);
                        }),
                    SizedBox(
                      height: 10.h,
                    ),
                    SecButton(
                        text: "Add to Cart",
                        btnFunction: () {
                          Provider.of<UserCredController>(context, listen: false)
                              .userModel
                              .addToCart(widget.productModel);
                        }),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextContainer extends StatelessWidget {
  TextContainer({
    @required this.content,
  });

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        decoration: BoxDecoration(
            color: widgetColor, borderRadius: BorderRadius.circular(20.r)),
        child: content);
  }
}

class RateCard extends StatelessWidget {
  RateCard({
    @required this.rate,
    @required this.productModel,
  });

  final double rate;
  final ProductModel productModel;
  final TextStyle numTextStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16.sp);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        UserModel userModel = Provider.of<UserCredController>(context,listen: false).userModel;
        userModel.addRate(rate: rate,productModel: productModel);
        Provider.of<CurrentProductRateController>(context,listen: false).setCurrentRate(rate: rate);
      },
      child: Container(
        child: Provider.of<CurrentProductRateController>(context).currentRate.toDouble() == rate.toDouble()
            ? Container(
          child: Center(
              child: Text(
                rate.toInt().toString(),
                style: numTextStyle,
              )),
          width: 30.r,
          height: 30.r,
          decoration: BoxDecoration(
            color: widgetColor,
            borderRadius: BorderRadius.circular(250.r),
          ),
        )
            : Text(
          rate.toInt().toString(),
          style: numTextStyle,
        ),
      ),
    );
  }
}
