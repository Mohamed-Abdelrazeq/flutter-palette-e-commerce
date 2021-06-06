import 'package:flutter/material.dart';
import 'RateModel.dart';
import '../Enums.dart';
import 'StoreModel.dart';

class ProductModel{
  ProductModel({
    @required this.name,
    @required this.description,
    @required this.image1URL,
    @required this.image2URL,
    @required this.image3URL,
    @required this.price,
    @required this.store,
    @required this.category,
    @required this.ratesList,
    @required this.status,
    @required this.available,
});

  String name;
  String description;
  String image1URL;
  String image2URL;
  String image3URL;
  double price;
  StoreModel store;
  Category category;
  List<RateModel> ratesList;
  Status status;
  bool available;

  void changeStatus(Status newStatus){
    status = newStatus;
  }

  void changeAvailability(bool isAvailable){
    available = isAvailable;
  }

  void addRate(RateModel newRate){
    ratesList.add(newRate);
  }
}