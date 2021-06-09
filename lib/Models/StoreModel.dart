import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Models/OrderModel.dart';
import 'package:multivender_ecommerce_app/Models/OwnerModel.dart';
import 'package:multivender_ecommerce_app/Models/ProductModel.dart';

class StoreModel{
  StoreModel({
    @required this.name,
    @required this.bio,
    @required this.owner,
    @required this.shippingCost,
});

  String                name;
  String                bio;
  OwnerModel            owner;
  List<OrderModel>      orders          = [];
  List<Category>        categories      = [];
  List<ProductModel>    products        = [];
  double                shippingCost;
  int                   counter          = 0;

  CollectionReference stores = FirebaseFirestore.instance.collection('stores');

  Future<void> addStore() async {
    //TODO : Check that the name is not used
    //TODO : test
    await stores.doc("$name").set({
    "name" : name,
    "bio" : bio,
    "owner" : owner,
    "orders" : orders,
    "categories" : categories,
    "products" : products,
    "shippingCost" : shippingCost,
    "counter" : counter,
    })
        .then((value) => print("Store Added"))
        .catchError((error) => print("Failed to add store: $error"));
  }

}