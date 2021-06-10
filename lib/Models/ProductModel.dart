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

  CollectionReference products = FirebaseFirestore.instance.collection('products');

  //Working
  Future<void> addProduct() async {
    id = "${store.name} $category $name";
    await products.doc("${store.name} $category $name").set({
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
  }
  //Working
  Future<void> readCategoryProducts(String key) async {
    List<ProductModel> myProductsList = [];
    await products.where('category',isEqualTo: key).get()
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
    await products.where('store.name',isEqualTo: key ).get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        myProductsList.add(ProductModel().toObject(doc.data()));
      });
    });
    return myProductsList;
  }
  //Working
  Future<void> updateProduct({String key,var value}) async {
    await products.doc(id)
        .update({key : value})
        .then((value) => print("Product Updated"))
        .catchError((error) => print("Failed to update product: $error"));
  }
  //Working
  Future<void> deleteProduct() async {
    await products
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


}

