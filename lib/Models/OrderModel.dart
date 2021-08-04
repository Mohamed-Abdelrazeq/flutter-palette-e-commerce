import 'package:cloud_firestore/cloud_firestore.dart';

import 'ProductModel.dart';
import 'UserModel.dart';

class OrderModel{
  OrderModel({
    this.product,
    this.user,
    this.status,
    this.price,
    this.orderingDate,
});

  ProductModel product;
  UserModel    user;
  String       status;
  DateTime     orderingDate;
  double       price;

  CollectionReference _orders = FirebaseFirestore.instance.collection('orders');
  //Working
  Future<void> addOrder() async {
    String id = "${user.uid} $orderingDate";
    await _orders.doc(id).set({
    "product" : product.toMap(),
    "user" : user.toMap(),
    "status" : status,
    "orderingDate" : orderingDate,
    "totalPrice" : price,
    })
        .then((value) => print("Products Added"))
        .catchError((error) => print("Failed to add product: $error"));
  }
  //Working
  Future<List<OrderModel>> readOrdersByUserMail(String key) async {
    List<OrderModel> myOrdersList = [];
    await _orders.where('user.mail',isEqualTo: key).get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        myOrdersList.add(OrderModel().toObject(doc.data()));
      });
    });
    print(myOrdersList);
    return myOrdersList;
  }
  //Working
  Future<List<OrderModel>> readOrdersByOwnerMail(String key) async {
    List<OrderModel> myOrdersList = [];
    await _orders.where('product.store.owner.mail',isEqualTo: key).get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        myOrdersList.add(OrderModel().toObject(doc.data()));
      });
    });
    print(myOrdersList);
    return myOrdersList;
  }
  //Working
  OrderModel toObject(Map json){
    Timestamp time = json["orderingDate"];
    OrderModel myOrder = OrderModel(
        product : ProductModel().toObject(json["product"]) ,
        user : UserModel().toObject(json["user"]),
        status : json["status"],
        price : json["totalPrice"],
        orderingDate : DateTime.fromMillisecondsSinceEpoch(time.seconds * 1000),
    );
    return myOrder;
  }
  //Working
  Map<String, dynamic> toMap() {
    return {
      "product" : product.toMap(),
      "user" : user.toMap(),
      "status" : status,
      "totalPrice" : price,
      "orderingDate" : orderingDate,
    };
  }

}