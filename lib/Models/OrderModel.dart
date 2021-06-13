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
  UserModel user;
  int quantity;
  String status;
  DateTime orderingDate;
  String comment;
  double totalPrice;

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