import 'package:cloud_firestore/cloud_firestore.dart';

import 'StoreModel.dart';


class ProductModel{
  ProductModel({
    this.name,
    this.description,
    this.image1URL,
    this.image2URL,
    this.image3URL,
    this.price,
    this.store,
    this.category,
    this.status,
    this.available,
});

  String name;
  String description;
  //todo : change to images list
  String image1URL;
  String image2URL;
  String image3URL;
  double price;
  StoreModel store;
  String category;
  //todo : handle rates model (toMap , toObject)
  List ratesList = [];
  String status;
  bool available;
  String id;

  CollectionReference _products = FirebaseFirestore.instance.collection('products');

  //Working
  Future<void> addProduct() async {
    id = "${store.name} $category $name";
    bool isUnique = await _checkUniqueProductInTheStore(name);
    if(isUnique){
      await _products.doc("${store.name} $category $name").set({
        "id" : id,
        "name" : name,
        "description" : description,
        "image1URL" : image1URL,
        "image2URL" : image2URL,
        "image3URL" : image3URL,
        "price" : price,
        "store" : store.toMap(),
        "category" : category,
        "ratesList" : ratesList,
        "status" : status,
        "available" : available,
      })
          .then((value) => print("Products Added"))
          .catchError((error) => print("Failed to add product: $error"));
    }else{
      print("Product already exists");
    }
  }
  //Developing
  Future<bool> _checkUniqueProductInTheStore(String key) async {
    List<ProductModel> myProductsList = [];
    await _products.where('name',isEqualTo: key).get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        myProductsList.add(ProductModel().toObject(doc.data()));
      });
    });
    if(myProductsList.isEmpty){
      return true;
    }else{
      return false;
    }
  }
  //Working
  Future<void> readCategoryProducts(String key) async {
    List<ProductModel> myProductsList = [];
    await _products.where('category',isEqualTo: key).get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        myProductsList.add(ProductModel().toObject(doc.data()));
      });
    });
    return myProductsList;
  }
  //Working
  Future<List<ProductModel>> readStoreProducts(String key) async {
    List<ProductModel> myProductsList = [];
    await _products.where('store.name',isEqualTo: key ).get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        myProductsList.add(ProductModel().toObject(doc.data()));
      });
    });
    return myProductsList;
  }
  //Working TODO : test it with images , rates and lists in general
  Future<void> updateProduct({String key,var value}) async {
    await _products.doc(id)
        .update({key : value})
        .then((value) => print("Product Updated"))
        .catchError((error) => print("Failed to update product: $error"));
  }
  //Working
  Future<void> deleteProduct() async {
    await _products
        .doc(id)
        .delete()
        .then((value) => print("Product Deleted"))
        .catchError((error) => print("Failed to delete product : $error"));
  }
  //Working
  ProductModel toObject(Map json){
    ProductModel myProduct = ProductModel(name: json["name"], description: json["description"], image1URL: json["image1URL"], image2URL: json["image2URL"], image3URL: json["image3URL"], price: json["price"], store: StoreModel().toObject(json["store"]) , category: json["category"], status: json["status"], available: json["available"]);
    myProduct.ratesList = json["ratesList"];
    myProduct.id = json["id"];
    return myProduct;
  }
  //Working
  Map<String, dynamic> toMap() {
    return {
      "name" : name,
      "description" : description,
      "image1URL" : image1URL,
      "image2URL" : image2URL,
      "image3URL" : image3URL,
      "price" : price,
      "store" : store.toMap(),
      "category" : category,
      "status" : status,
      "available" : available,
      "ratesList" : ratesList,
    };
  }

}

