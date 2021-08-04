import 'package:cloud_firestore/cloud_firestore.dart';

import 'ProductModel.dart';
import 'UserModel.dart';

class OrderModel{
  OrderModel({
    this.products,
    this.user,
    this.status,
    this.price,
    this.orderingDate,
});

  List<ProductModel> products;
  UserModel    user;
  String       status;
  DateTime     orderingDate;
  double       price;

  CollectionReference _orders = FirebaseFirestore.instance.collection('orders');
  //Working
  Future<void> addOrder() async {
    String id = "${user.uid} $orderingDate";
    List<Map> productsJson = [];
    products.forEach((element) {
      productsJson.add(element.toMap());
    });
    await _orders.doc(id).set({
    "products" : productsJson,
    "user" : user.toMap(),
    "status" : status,
    "orderingDate" : orderingDate,
    "totalPrice" : price,
    })
        .then((value) => print("Products Added"))
        .catchError((error) => print("Failed to add product: $error"));
  }
  //Working todo
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
  //Working todo
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
    List<Map> productsJson = json["products"];
    List<ProductModel> productsModel = [];
    productsJson.forEach((element) {
      productsModel.add(
      ProductModel().toObject(element)
      );
    });
    OrderModel myOrder = OrderModel(
        products :  productsModel,
        user : UserModel().toObject(json["user"]),
        status : json["status"],
        price : json["totalPrice"],
        orderingDate : DateTime.fromMillisecondsSinceEpoch(time.seconds * 1000),
    );
    return myOrder;
  }
  //Working
  Map<String, dynamic> toMap() {
    List<Map> productsJson = [];
    products.forEach((element) {
      productsJson.add(element.toMap());
    });
    return {
      "products" : productsJson,
      "user" : user.toMap(),
      "status" : status,
      "totalPrice" : price,
      "orderingDate" : orderingDate,
    };
  }

}