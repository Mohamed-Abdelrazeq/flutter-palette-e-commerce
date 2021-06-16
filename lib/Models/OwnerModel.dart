import 'package:multivender_ecommerce_app/Models/StoreModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OwnerModel {
  OwnerModel({
    this.name,
    this.lon,
    this.lat,
    this.address,
    this.mobile,
    this.mail,
  });

  String name;
  StoreModel store;
  double lon;
  double lat;
  String address;
  String mobile;
  String mail;

  FirebaseAuth _auth = FirebaseAuth.instance;



  //Working
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "lon": lon,
      "lat": lat,
      "address": address,
      "mobile": mobile,
      "mail": mail,
    };
  }
  //Working
  OwnerModel toObject(Map json) {
    return OwnerModel(
        name: json["name"],
        lon: json["lon"],
        lat: json["lat"],
        address: json["address"],
        mobile: json["mobile"],
        mail: json["mail"]);
  }
  //Working
  Future<bool> isSignedIn() async {
    bool isSigned;

    _auth.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
        isSigned = false;
      } else {
        isSigned = true;
        print('User is signed in!');
      }
    });
    return isSigned;
  }
  //Working
  Future<void> signOut()async{
    await  _auth.signOut();
  }
  //Working
  Future<void> registerViaEmail(String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: mail,
          password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
  //Working
  Future<void> loginViaEmail(String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: mail,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
  //TODO : Later
  Future<void> registerViaPhone() async {

  }
  //TODO : Later
  Future<void> loginViaPhone() async {

  }

}
