import 'package:cloud_firestore/cloud_firestore.dart';

import 'ProductModel.dart';
import 'UserModel.dart';

import 'StatusModel.dart';


class OrderModel{
  OrderModel({
    this.product,
    this.user,
    this.quantity,
    this.status,
    this.comment,
    this.totalPrice,
    this.orderingDate,
});

  ProductModel product;
  UserModel    user;
  int          quantity;
  String       status;
  DateTime     orderingDate;
  String       comment;
  double       totalPrice;

  CollectionReference _orders = FirebaseFirestore.instance.collection('orders');

  Future<void> addOrder() async {
    String id = "${user.name} ${product.name} $orderingDate";
    await _orders.doc(id).set({
    "product" : product.toMap(),
    "user" : user.toMap(),
    "quantity" : quantity,
    "status" : status,
    "orderingDate" : orderingDate,
    "comment" : comment,
    "totalPrice" : totalPrice,
    })
        .then((value) => print("Products Added"))
        .catchError((error) => print("Failed to add product: $error"));
  }
  //Working
  OrderModel toObject(Map json){
    OrderModel myOrder = OrderModel(
        product : ProductModel().toObject(json["product"]) ,
        user : UserModel().toObject(json["user"]),
        quantity : json["quantity"],
        status : json["status"],
        comment : json["comment"],
        totalPrice : json["totalPrice"],
        orderingDate : json["orderingDate"],
    );
    return myOrder;
  }
  //Working
  Map<String, dynamic> toMap() {
    return {
      "product" : product.toMap(),
      "user" : user.toMap(),
      "quantity" : quantity,
      "status" : status,
      "comment" : comment,
      "totalPrice" : totalPrice,
      "orderingDate" : orderingDate,
    };
  }

}