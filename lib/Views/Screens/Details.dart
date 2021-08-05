import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Controllers/UserCredController.dart';
import 'package:multivender_ecommerce_app/Models/ProductModel.dart';
import 'package:multivender_ecommerce_app/Models/UserRateModel.dart';
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
  final TextStyle numTextStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 16.sp
  );

  double currentUserRate = 6.0;

  @override
  Widget build(BuildContext context) {
    // List<UserRateModel> rates =
    print(
        Provider.of<UserCredController>(context).userModel.rates
    );
    // for(var i = 0;i<rates.length;i++){
    //   if(rates[i].to.name == widget.productModel.name){
    //     setState(() {
    //       currentUserRate = rates[i].rate;
    //     });
    //   }
    // }
    return Scaffold(
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
                  child: TextContainer(content: Text(
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
            SizedBox(height: 20.h,),
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
                      TextContainer(content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.monetization_on,color: white60,size: 20.r,),
                          SizedBox(width: 10.w,),
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
                  SizedBox(height: 20.h,),
                  TextContainer(content: Padding(
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
                  SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      currentUserRate == 1 ? Container(
                        child: Center(child: Text("1",style: numTextStyle,)),
                        width: 30.r,
                        height: 30.r,
                        decoration: BoxDecoration(
                          color: widgetColor,
                          borderRadius: BorderRadius.circular(250.r),
                        ),
                      ) : Text("1",style: numTextStyle,),
                      currentUserRate == 2 ? Container(
                        child: Center(child: Text("2",style: numTextStyle,)),
                        width: 30.r,
                        height: 30.r,
                        decoration: BoxDecoration(
                          color: widgetColor,
                          borderRadius: BorderRadius.circular(250.r),
                        ),
                      ) : Text("2",style: numTextStyle,),
                      currentUserRate == 3 ? Container(
                        child: Center(child: Text("3",style: numTextStyle,)),
                        width: 30.r,
                        height: 30.r,
                        decoration: BoxDecoration(
                          color: widgetColor,
                          borderRadius: BorderRadius.circular(250.r),
                        ),
                      ) : Text("3",style: numTextStyle,),
                      currentUserRate == 4 ? Container(
                        child: Center(child: Text("4",style: numTextStyle,)),
                        width: 30.r,
                        height: 30.r,
                        decoration: BoxDecoration(
                          color: widgetColor,
                          borderRadius: BorderRadius.circular(250.r),
                        ),
                      ) : Text("4",style: numTextStyle,),
                      currentUserRate == 5 ? Container(
                        child: Center(child: Text("5",style: numTextStyle,)),
                        width: 30.r,
                        height: 30.r,
                        decoration: BoxDecoration(
                          color: widgetColor,
                          borderRadius: BorderRadius.circular(250.r),
                        ),
                      ) : Text("5",style: numTextStyle,),
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  MainButton(text: "Add to Favourite", btnFunction: (){
                    Provider.of<UserCredController>(context,listen: false).userModel.addToFavourite(widget.productModel);
                  }),
                  SizedBox(height: 10.h,),
                  SecButton(text: "Add to Cart", btnFunction: (){
                    Provider.of<UserCredController>(context,listen: false).userModel.addToCart(widget.productModel);
                  }),
                  SizedBox(height: 20.h,),
                ],
              ),
            ),

          ],
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
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
      decoration: BoxDecoration(
          color: widgetColor,
          borderRadius: BorderRadius.circular(20.r)
      ),
      child: content
    );
  }
}

