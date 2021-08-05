import 'ProductModel.dart';

class UserRateModel {
  UserRateModel({
    this.to,
    this.rate
  });

  ProductModel to;
  int rate;

  double avgRate(List<UserRateModel> ratesList){
    double total = 0;
    for(var i = 0;i <= ratesList.length;i++){
      total = total + ratesList[i].rate;
    }
    return (total / ratesList.length);
  }
  //Working
  UserRateModel toObject(Map json){
    Map myTo = json["to"];
    UserRateModel myRate = UserRateModel(
      to : ProductModel().toObject(myTo),
      rate : json["rate"],
    );
    return myRate;
  }
  //Working
  Map<String, dynamic> toMap() {
    return {
      "to" : to.toMap(),
      "rate" : rate,
    };
  }

}