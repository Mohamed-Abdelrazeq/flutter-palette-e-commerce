import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multivender_ecommerce_app/Models/ProductModel.dart';


class UserModel {

  UserModel({
    this.uid,
    this.mobile,
    this.lat,
    this.lng,
  });

  String uid;
  String mobile;
  double lat;
  double lng;
  List<ProductModel> favourite = [];
  List<ProductModel> cart      = [];
  List    rates     = [];

  CollectionReference _users = FirebaseFirestore.instance.collection('users');

  //Working
  Future<void> addUser() async {
    List fav = [];
    List car = [];
    favourite.forEach((element) {fav.add(element.toMap());});
    cart.forEach((element) {car.add(element.toMap());});
    String id = "$uid";
    await _users.doc(id).set({
      "uid" : uid,
      "mobile" : mobile,
      "lat" : lat,
      "lon" : lng,
      "favourite" :fav,
      "cart"      : car,
      "rates" : rates,
    })
        .then((value) => print("Products Added"))
        .catchError((error) => print("Failed to add product: $error"));
  }
  //Working
  UserModel toObject(Map json){
    List fav = json["favourite"];
    List<ProductModel> favPro = [];
    for(var i = 0 ; i < fav.length;i++){
      favPro.add(ProductModel().toObject(fav[i]));
    }
    List car = json["cart"];
    List<ProductModel> carPro = [];
    for(var i = 0 ; i < car.length;i++){
      carPro.add(ProductModel().toObject(fav[i]));
    }
    UserModel theUser = UserModel(uid: json["uid"], mobile: json["mobile"], lat: json["lat"], lng: json["lon"]);
    theUser.favourite = favPro;
    theUser.cart      = carPro;
    theUser.rates     = json["rates"];
    return theUser;
  }
  //Working
  Map<String, dynamic> toMap() {
    List fav = [];
    List car = [];
    favourite.forEach((element) {fav.add(element.toMap());});
    cart.forEach((element) {car.add(element.toMap());});
    return {
      "uid" : uid,
      "mobile" : mobile,
      "lat" : lat,
      "lon" : lng,
      "favourite" : fav,
      "cart" : car,
      "rates" : rates,
    };
  }


}