import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'ProductModel.dart';
import 'SizeModel.dart';
import 'StoreModel.dart';

//TODO : test methods
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
  List<Color>  colors = [];

  void addSize(MySize newSize){
    sizes.add(newSize);
  }

  void addColor(Color newColor){
    colors.add(newColor);
  }

  CollectionReference _tShirt = FirebaseFirestore.instance.collection('tShirts');

  //Working
  Future<void> addTShirt() async {
    id = "${store.name} $category $name";
    bool isUnique = await _checkUniqueTShirtInTheStore(name);
    if(isUnique){
      await _tShirt.doc("${store.name} $category $name").set({
        "id" : id,
        "name" : name,
        "description" : description,
        "images" : images,
        "price" : price,
        "store" : store.toMap(),
        "category" : category,
        "status" : status,
        "available" : available,
        "sizes" : sizes,
        "colors" : colors,
      })
          .then((value) => print("TShirt Added"))
          .catchError((error) => print("Failed to add TShirt: $error"));
    }else{
      print("TShirt already exists");
    }
  }
  //Developing
  Future<bool> _checkUniqueTShirtInTheStore(String key) async {
    List<TShirtModel> myTShirtsList = [];
    await _tShirt.where('name',isEqualTo: key).get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        myTShirtsList.add(TShirtModel().toObject(doc.data()));
      });
    });
    if(myTShirtsList.isEmpty){
      return true;
    }else{
      return false;
    }
  }
  //Working
  Future<List<TShirtModel>> readStoreTShirts(String key) async {
    List<TShirtModel> myTShirtsList = [];
    await _tShirt.where('store.name',isEqualTo: key ).get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        myTShirtsList.add(TShirtModel().toObject(doc.data()));
      });
    });
    return myTShirtsList;
  }
  //Working
  Future<void> updateTShirt({String key,var value}) async {
    id = "${store.name} $category $name";
    await _tShirt.doc(id)
        .update({key : value})
        .then((value) => print("TShirt Updated"))
        .catchError((error) => print("Failed to update TShirt: $error"));
  }
  //Working
  Future<void> deleteTShirt() async {
    await _tShirt
        .doc(id)
        .delete()
        .then((value) => print("TShirtModel Deleted"))
        .catchError((error) => print("Failed to delete TShirtModel : $error"));
  }
  //Working
  TShirtModel toObject(Map json){
    TShirtModel myTShirt = TShirtModel(name: json["name"], description: json["description"]  ,price: json["price"], store: StoreModel().toObject(json["store"]) , category: json["category"], status: json["status"], available: json["available"]);
    myTShirt.id = json["id"];
    myTShirt.images = json["images"];
    myTShirt.sizes  = json["sizes"];
    myTShirt.colors = json["colors"];
    return myTShirt;
  }
  //Working
  Map<String, dynamic> toMap() {
    return {
      "name" : name,
      "description" : description,
      "images" : images,
      "price" : price,
      "store" : store.toMap(),
      "category" : category,
      "status" : status,
      "available" : available,
      "sizes" :  sizes ,
      "colors" :  colors,
    };
  }
  
}