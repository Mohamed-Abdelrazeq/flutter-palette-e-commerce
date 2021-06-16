import 'package:flutter/material.dart';
import 'ProductModel.dart';
import 'SizeModel.dart';
import 'StoreModel.dart';

//TODO : edit methods
class TShirtModel extends ProductModel {

  TShirtModel({
    String name,
    String description,
    double price,
    StoreModel store,
    String category,
    String status, bool available,
  }) : super(
    name :  name,
    description :  description,
    price :  price,
    store :  store,
    category :  category,
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