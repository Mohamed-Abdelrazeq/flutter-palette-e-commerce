import 'package:cloud_firestore/cloud_firestore.dart';
import 'OwnerModel.dart';


class StoreModel{
  StoreModel({
    this.name,
    this.bio,
    this.owner,
    this.shippingCost,
});

  String                name;
  String                bio;
  OwnerModel            owner;
  List                  orders          = [];
  List                  categories      = [];
  double                shippingCost;

  CollectionReference _stores = FirebaseFirestore.instance.collection('stores');
  //Working
  Map<String, dynamic> toMap() {
    return {
    "name" : name,
    "bio" : bio,
    "owner" : owner.toMap(),
    "orders" : orders,
    "categories" : categories,
    "shippingCost" : shippingCost,
  };
  }
  //Working
  StoreModel toObject(Map json){
    StoreModel myStore = StoreModel(name: json["name"], bio: json["bio"], owner: OwnerModel().toObject(json["owner"]), shippingCost: json["shippingCost"]);
    myStore.categories = json["categories"];
    myStore.orders = json["orders"];

    return myStore;
  }

  Future<void> addStore() async {
    bool isUnique = await _uniqueNameCheck(name);
    if(isUnique){
      await _stores.doc("$name").set({
        "name" : name,
        "bio" : bio,
        "owner" : owner.toMap(),
        "orders" : orders,
        "categories" : categories,
        "shippingCost" : shippingCost,
      })
          .then((value) => print("Store Added"))
          .catchError((error) => print("Failed to add store: $error"));
    }
    else{
      print("this is not a unique name");
    }
  }

  Future<List<StoreModel>> readStores()async{
    List<StoreModel> stores = [];
    await _stores
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        StoreModel store = StoreModel().toObject(doc.data());
        stores.add(store);
      });
    });

    print(stores);

    return stores;
  }

  Future<StoreModel> readStoreByName(key)async{
    StoreModel theStore;
    await _stores.where('name',isEqualTo: key ).get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        theStore = StoreModel().toObject(doc.data());
      });
    });
    print(theStore.toMap());

    if(theStore == null){
      return null;
    }
    return theStore;
  }

  Future<bool> _uniqueNameCheck(key)async{
    StoreModel theStore;
    await _stores.where('name',isEqualTo: key ).get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        theStore = StoreModel().toObject(doc.data());
      });
    });
    if(theStore == null){
      return true;
    }
    return false;
  }

}