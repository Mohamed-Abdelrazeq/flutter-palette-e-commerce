import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel{
  ProductModel({
    this.name,
    this.description,
    this.price,
    this.category,
    this.status,
    this.available,
});

  String name;
  String description;
  List images = [];
  double price;
  String category;
  String status;
  bool available;
  String id;

  CollectionReference _products = FirebaseFirestore.instance.collection('products');

  //Working
  Future<void> addProduct() async {
    id = "$category $name";
    bool isUnique = await _checkUniqueProductInTheStore(name);
    if(isUnique){
      await _products.doc(" $category $name").set({
        "id" : id,
        "name" : name,
        "description" : description,
        "images" : images,
        "price" : price,
        "category" : category,
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
  //Working
  Future<void> updateProduct({String key,var value}) async {
    id = "$category $name";
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
    ProductModel myProduct = ProductModel(name: json["name"], description: json["description"]  ,price: json["price"], category: json["category"], status: json["status"], available: json["available"]);
    myProduct.id = json["id"];
    myProduct.images = json["images"];
    return myProduct;
  }
  //Working
  Map<String, dynamic> toMap() {
    return {
      "name" : name,
      "description" : description,
      "images" : images,
      "price" : price,
      "category" : category,
      "status" : status,
      "available" : available,
    };
  }

}

