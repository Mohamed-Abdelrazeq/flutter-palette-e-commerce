import 'package:flutter/material.dart';
import 'ProductModel.dart';
import 'UserModel.dart';

class RateModel {
  RateModel({
    @required this.from,
    @required this.to,
    @required this.rate
});

  UserModel from;
  ProductModel to;
  int rate;

  double avgRate(List<RateModel> ratesList){
    double total = 0;
    for(var i = 0;i <= ratesList.length;i++){
      total = total + ratesList[i].rate;
    }
    return (total / ratesList.length);
  }

}