import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multivender_ecommerce_app/Models/ProductModel.dart';

import 'UserRateModel.dart';

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
  List<ProductModel> cart = [];
  List<UserRateModel> rates = [];

  CollectionReference _users = FirebaseFirestore.instance.collection('users');

  //Working
  Future<void> addUser() async {
    List fav = [];
    List car = [];
    favourite.forEach((element) {
      fav.add(element.toMap());
    });
    cart.forEach((element) {
      car.add(element.toMap());
    });
    String id = "$uid";
    await _users
        .doc(id)
        .set({
          "uid": uid,
          "mobile": mobile,
          "lat": lat,
          "lon": lng,
          "favourite": fav,
          "cart": car,
          "rates": rates,
        })
        .then((value) => print("Products Added"))
        .catchError((error) => print("Failed to add product: $error"));
  }
  //Working
  UserModel toObject(Map json) {
    List fav = json["favourite"];
    List<ProductModel> favPro = [];
    for (var i = 0; i < fav.length; i++) {
      favPro.add(ProductModel().toObject(fav[i]));
    }
    List car = json["cart"];
    List<ProductModel> carPro = [];
    for (var i = 0; i < car.length; i++) {
      carPro.add(ProductModel().toObject(car[i]));
    }
    UserModel theUser = UserModel(
        uid: json["uid"],
        mobile: json["mobile"],
        lat: json["lat"],
        lng: json["lon"]);
    theUser.favourite = favPro;
    theUser.cart = carPro;
    theUser.rates = json["rates"];
    return theUser;
  }
  //Working
  Map<String, dynamic> toMap() {
    List fav = [];
    List car = [];
    favourite.forEach((element) {
      fav.add(element.toMap());
    });
    cart.forEach((element) {
      car.add(element.toMap());
    });
    return {
      "uid": uid,
      "mobile": mobile,
      "lat": lat,
      "lon": lng,
      "favourite": fav,
      "cart": car,
      "rates": rates,
    };
  }
  //Working
  Future<void> addToCart(ProductModel productModel) async {
    List<Map> newCart = [];
    bool duplicationFlag = false;
    for (var i = 0; i < cart.length; i++) {
      if (cart[i].toMap().toString() == productModel.toMap().toString()) {
        duplicationFlag = true;
        break;
      } else {
        duplicationFlag = false;
      }
    }
    if (!duplicationFlag) {
      cart.add(productModel);
      cart.forEach((element) {
        newCart.add(element.toMap());
      });
      await _users
          .doc(uid)
          .update({'cart': newCart})
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    } else {
      print("Duplicated");
    }
  }
  //Working
  Future<void> cleanCart()async{
    cart = [];
    await _users
        .doc(uid)
        .update({'cart': cart})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
  //Working
  Future<void> addToFavourite(ProductModel productModel) async {
    bool duplicationFlag = false;
    List<Map> newFavourite = [];
    for (var i = 0; i < favourite.length; i++) {
      if (favourite[i].toMap().toString() == productModel.toMap().toString()) {
        duplicationFlag = true;
        break;
      } else {
        duplicationFlag = false;
      }
    }
    if (!duplicationFlag) {
      favourite.add(productModel);
      favourite.forEach((element) {
        newFavourite.add(element.toMap());
      });
      await _users
          .doc(uid)
          .update({'favourite': newFavourite})
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    } else {
      print("Duplicated");
    }
  }
  //Working
  Future<UserModel> getUserDataByUID(String uid) async {
    var userModelJson = await _users.doc(uid).get();
    UserModel userModel = UserModel().toObject(userModelJson.data());
    return userModel;
  }
  //Working
  Future<void> addPhoneNumber() async {
    await _users
        .doc(uid)
        .update({"mobile": mobile})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}
