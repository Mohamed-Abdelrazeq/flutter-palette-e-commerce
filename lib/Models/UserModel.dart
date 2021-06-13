import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Models/ProductModel.dart';

import 'CategoryModel.dart';
import 'OrderModel.dart';
import 'OwnerModel.dart';
import 'RateModel.dart';
import 'StatusModel.dart';
import 'StoreModel.dart';

ProductModel myProduct = ProductModel(
    name: "ProductName",
    description: "Product Description",
    image1URL: "image1URL",
    image2URL: "image2URL",
    image3URL: "image3URL",
    price: 22,
    store: StoreModel(
        name: "StoreName",
        bio: "bio",
        owner: OwnerModel(
            name: "ownerName",
            lon: 22,
            lat: 44,
            address: "address",
            mobile: "01555244006",
            mail: "mail"),
        shippingCost: 10),
    category: Category().plant,
    status: Status().stock,
    available: true);

class UserModel {

  UserModel({
    @required this.name,
    @required this.mail,
    @required this.mobile,
    @required this.lat,
    @required this.lon,
  });

  String name;
  String mail;
  String mobile;
  double lat;
  double lon;
  List<ProductModel> favourite = [myProduct,myProduct];
  List<ProductModel> cart      = [myProduct,myProduct];
  List<OrderModel>   orders    = [];
  List<RateModel>    rates     = [];

  CollectionReference _users = FirebaseFirestore.instance.collection('users');



  //Working
  Future<void> addUser() async {
    List fav = [];
    List car = [];
    favourite.forEach((element) {fav.add(element.toMap());});
    cart.forEach((element) {car.add(element.toMap());});
    String id = "$mail $name $mobile";
    await _users.doc(id).set({
      "name" : name,
      "mail" : mail,
      "mobile" : mobile,
      "lat" : lat,
      "lon" : lon,
      "favourite" :fav,
      "cart"      : car,
      "orders" : orders,
      "rates" : rates,
    })
        .then((value) => print("Products Added"))
        .catchError((error) => print("Failed to add product: $error"));
  }
}