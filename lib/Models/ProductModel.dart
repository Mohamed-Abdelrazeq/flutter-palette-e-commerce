import 'package:cloud_firestore/cloud_firestore.dart';
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
  String id;

  CollectionReference products = FirebaseFirestore.instance.collection('products');

  Future<void> addProduct() async {
    id = "${store.name} ${store.counter}";
    await products.doc("${store.name} ${store.counter}").set({
      "id" : "${store.name} ${store.counter}",
      "name," : name,
      "description," : description,
      "image1URL," : image1URL,
      "image2URL," : image2URL,
      "image3URL," : image3URL,
      "price," : price,
      "store," : store,
      "category," : category,
      "ratesList," : ratesList,
      "status," : status,
      "available," : available,
    })
        .then((value) => print("Products Added"))
        .catchError((error) => print("Failed to add product: $error"));
  }

  Future<void> updateProduct({String id,var value}) async {
    await products.doc(id)
        .update({id : value})
        .then((value) => print("Product Updated"))
        .catchError((error) => print("Failed to update product: $error"));
  }

  Future<void> deleteUser() async {
    await products
        .doc(id)
        .delete()
        .then((value) => print("Product Deleted"))
        .catchError((error) => print("Failed to delete product : $error"));
  }

}