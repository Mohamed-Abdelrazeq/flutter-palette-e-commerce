import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'OrderModel.dart';
import 'OwnerModel.dart';

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
  double                shippingCost;
  int                   counter          = 0;

  CollectionReference stores = FirebaseFirestore.instance.collection('stores');

  Map<String, dynamic> toMap() {
    return {
    "name" : name,
    "bio" : bio,
    "owner" : owner.toMap(),
    "orders" : orders,
    "categories" : categories,
    "shippingCost" : shippingCost,
    "counter" : counter,
  };
  }

  StoreModel toObject(Map json){
    StoreModel myStore = StoreModel(name: json["name"], bio: json["bio"], owner: json["owner"], shippingCost: json["shippingCost"]);
    myStore.categories = json["categories"];
    myStore.orders = json["orders"];
    myStore.counter = json["counter"];

    return myStore;
  }

  Future<void> addStore() async {
    //TODO : Check that the name is not used
    //TODO : test
    await stores.doc("$name").set({
    "name" : name,
    "bio" : bio,
    "owner" : owner,
    "orders" : orders,
    "categories" : categories,
    "shippingCost" : shippingCost,
    "counter" : counter,
    })
        .then((value) => print("Store Added"))
        .catchError((error) => print("Failed to add store: $error"));
  }

}