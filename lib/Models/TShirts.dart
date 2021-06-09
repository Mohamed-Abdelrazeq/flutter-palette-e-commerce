import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Enums.dart';
import 'ProductModel.dart';
import 'RateModel.dart';
import 'StoreModel.dart';

class TShirtModel extends ProductModel {

  TShirtModel({
    String name,
    String description,
    String image1URL,
    String image2URL,
    String image3URL,
    double price,
    StoreModel store,
    Category category,
    List<RateModel> ratesList,
    Status status, bool available,
  }) : super(
    name :  name,
    description :  description,
    image1URL :  image1URL,
    image2URL :  image2URL,
    image3URL :  image3URL,
    price :  price,
    store :  store,
    category :  category,
    ratesList :  ratesList,
    status :  status,
    available :  available,
  );

  List<MySize> sizes = [];
  List<Color> colors = [];

  void addSize(MySize newSize){
    sizes.add(newSize);
  }

  void addColor(Color newColor){
    colors.add(newColor);
  }
  
}