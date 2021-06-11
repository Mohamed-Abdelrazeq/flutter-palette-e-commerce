import 'package:cloud_firestore/cloud_firestore.dart';
import 'OwnerModel.dart';

class StoreModel{
  StoreModel({
    this.name,
    this.bio,
    this.owner,
    this.shippingCost,
});

  String                name;
  String                bio;
  OwnerModel            owner;
  List                  orders          = [];
  List                  categories      = [];
  double                shippingCost;

  CollectionReference stores = FirebaseFirestore.instance.collection('stores');
  //Working
  Map<String, dynamic> toMap() {
    return {
    "name" : name,
    "bio" : bio,
    "owner" : owner.toMap(),
    "orders" : orders,
    "categories" : categories,
    "shippingCost" : shippingCost,
  };
  }
  //Working
  StoreModel toObject(Map json){
    StoreModel myStore = StoreModel(name: json["name"], bio: json["bio"], owner: OwnerModel().toObject(json["owner"]), shippingCost: json["shippingCost"]);
    myStore.categories = json["categories"];
    //TODO : otObject method on orders model
    myStore.orders = json["orders"];

    return myStore;
  }
  //Archived
  // Future<void> addStore() async {
  //   await stores.doc("$name").set({
  //   "name" : name,
  //   "bio" : bio,
  //   "owner" : owner,
  //   "orders" : orders,
  //   "categories" : categories,
  //   "shippingCost" : shippingCost,
  //   })
  //       .then((value) => print("Store Added"))
  //       .catchError((error) => print("Failed to add store: $error"));
  // }

}