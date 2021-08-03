import 'package:cloud_firestore/cloud_firestore.dart';
import 'ProductModel.dart';
import 'UserModel.dart';

class RateModel {
  RateModel({
    this.from,
    this.to,
    this.rate
});

  UserModel from;
  ProductModel to;
  int rate;

  double avgRate(List<RateModel> ratesList){
    double total = 0;
    for(var i = 0;i <= ratesList.length;i++){
      total = total + ratesList[i].rate;
    }
    return (total / ratesList.length);
  }

  CollectionReference _rates = FirebaseFirestore.instance.collection('rates');
  //Working
  Future<void> addRate() async {
    String id = "${from.uid} ${to.name} ";
    await _rates.doc(id).set({
      "from" : from.toMap(),
      "to" : to.toMap(),
      "rate" : rate,
    })
        .then((value) => print("Rate Added"))
        .catchError((error) => print("Failed to add rate: $error"));
  }
  //Working
  Future<List<RateModel>> readRatesByUserUID(String key) async {
    List<RateModel> myRatesList = [];
    await _rates.where('from.uid',isEqualTo: key).get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        myRatesList.add(RateModel().toObject(doc.data()));
      });
    });
    print(myRatesList);
    return myRatesList;
  }
  //Working
  Future<List<RateModel>> readRatesByProductName(String key) async {
    List<RateModel> myRatesList = [];
    await _rates.where('to.name',isEqualTo: key).get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        myRatesList.add(RateModel().toObject(doc.data()));
      });
    });
    print(myRatesList);
    return myRatesList;
  }
  //Working
  RateModel toObject(Map json){
    Map myFrom = json["from"];
    Map myTo = json["to"];
    RateModel myRate = RateModel(
        from : UserModel().toObject(myFrom),
        to : ProductModel().toObject(myTo),
        rate : json["rate"],
    );
    return myRate;
  }
  //Working
  Map<String, dynamic> toMap() {
    return {
      "from" : from.toMap(),
      "to" : to.toMap(),
      "rate" : rate,
    };
  }

}