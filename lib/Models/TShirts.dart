import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Enums.dart';
import 'ProductModel.dart';

class TShirtModel extends ProductModel {

  TShirtModel({
    @required this.sizes,
    @required this.colors,
});

  List<MySize> sizes;
  List<Color> colors;

}