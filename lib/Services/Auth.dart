import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:multivender_ecommerce_app/Models/UserModel.dart';
import 'package:multivender_ecommerce_app/Views/FutureReturn/FlashBar.dart';

class Auth {

  FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference _users = FirebaseFirestore.instance.collection('users');

  Future<void> logout({BuildContext context}) async {
    flashBar(title: "Please Wait", message: 'This will take a second', context: context);
    await _auth.signOut();
  }

  Future<bool> isLoggedIn() async {
    _auth.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
        return false;
      } else {
        print('User is signed in!');
        return true;
      }
    });
    return false;
  }







  Future<UserModel> signInWithGoogle({double lng ,double lat,BuildContext context}) async {
    flashBar(title: "Please Wait", message: 'This will take a second', context: context);
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    var userCheckJson = await _users.doc(userCredential.user.uid).get();
    if(userCheckJson.data() != null){
      return UserModel().toObject(userCheckJson.data());
    }
    else{
      UserModel userModel = UserModel(uid: userCredential.user.uid,mobile: "",lng:lng,lat: lat);
      userModel.addUser();
      return userModel;
    }
  }

  Future<UserModel> signInWithFacebook({double lng ,double lat,BuildContext context}) async {
    flashBar(title: "Please Wait", message: 'This will take a second', context: context);
    FacebookAuth.instance.logOut();
      final  result = await FacebookAuth.instance.login();
      final facebookAuthCredential = FacebookAuthProvider.credential(result.token);
      // Once signed in, return the UserCredential
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      var userCheckJson = await _users.doc(userCredential.user.uid).get();
      if(userCheckJson.data() != null){
        return UserModel().toObject(userCheckJson.data());
      } else{
        UserModel userModel = UserModel(uid: userCredential.user.uid,mobile: "",lng:lng,lat: lat);
        userModel.addUser();
        return userModel;
      }

  }






  Future<UserModel> register({String mail, String password, String phone,double lng ,double lat,BuildContext context}) async {
    flashBar(title: "Please Wait", message: 'This will take a second', context: context);
    if(mail == "" || password == "" || phone == ""){
      flashBar(title: "Warning", message: 'Check the Fields', context: context);
      return null;
    }else{
      UserModel userModel;
      UserCredential userCredential;
      try {
        userCredential = await _auth.createUserWithEmailAndPassword(email: mail, password: password);
        userModel = UserModel(uid: userCredential.user.uid,mobile: phone, lng:lng, lat: lat);
        userModel.addUser();
        return userModel;
      } on FirebaseAuthException catch (e) {
        flashBar(title: "Warning", message: 'Check the Fields', context: context);
        if (e.code == 'weak-password') {
          flashBar(title: "Warning", message: 'The password provided is too weak.', context: context);
        } else if (e.code == 'email-already-in-use') {
          flashBar(title: "Warning", message: 'The account already exists for that email.', context: context);
        }
      } catch (e) {
        flashBar(title: "Warning", message: e.toString(), context: context);
      }
      return null;
    }
  }

  Future<UserModel> login({String mail, String password,BuildContext context}) async {
    flashBar(title: "Please Wait", message: 'This will take a second', context: context);
    if(mail == "" || password == "" ){
      flashBar(title: "Warning", message: 'Check the Fields', context: context);
      return null;
    }else{
      UserModel userModel;
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: mail, password: password);
        var userModelJson = await _users.doc(userCredential.user.uid).get();
        userModel = UserModel().toObject(userModelJson.data());
      } on FirebaseAuthException catch (e) {
        flashBar(title: "Warning", message: 'Check the Fields', context: context);
        if (e.code == 'user-not-found') {
          flashBar(title: "Warning", message: 'No user found for that email.', context: context);
        } else if (e.code == 'wrong-password') {
          flashBar(title: "Warning", message: 'Wrong password provided for that user.', context: context);
        }
      }
      return userModel;
    }
  }

}
