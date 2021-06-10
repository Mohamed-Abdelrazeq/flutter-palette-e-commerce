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

  StoreModel toObject(Map json){
    StoreModel myStore = StoreModel(name: json["name"], bio: json["bio"], owner: OwnerModel().toObject(json["owner"]), shippingCost: json["shippingCost"]);
    myStore.categories = json["categories"];
    //TODO : otObject method on orders model
    myStore.orders = json["orders"];

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
    })
        .then((value) => print("Store Added"))
        .catchError((error) => print("Failed to add store: $error"));
  }

}