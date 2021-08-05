import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:multivender_ecommerce_app/Models/UserModel.dart';

class Auth {

  FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference _users = FirebaseFirestore.instance.collection('users');

  Future<void> logout() async {
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




  Future<UserModel> signInWithGoogle({double lng ,double lat}) async {
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
    print(userCheckJson.data());
    if(userCheckJson.data() != null){
      return UserModel().toObject(userCheckJson.data());
    }
    else{
      print('its null');
      UserModel userModel = UserModel(uid: userCredential.user.uid,mobile: "",lng:lng,lat: lat);
      userModel.addUser();
      return userModel;
    }
  }

  Future<UserModel> signInWithFacebook({double lng ,double lat}) async {
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

  Future<UserModel> register({String mail, String password, String phone,double lng ,double lat}) async {
    UserModel userModel;
    UserCredential userCredential;
    try {
      userCredential = await _auth.createUserWithEmailAndPassword(email: mail, password: password);
      userModel = UserModel(uid: userCredential.user.uid,mobile: phone, lng:lng, lat: lat);
      userModel.addUser();
      return userModel;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<UserModel> login({String mail, String password}) async {
    UserModel userModel;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: mail, password: password);
      var userModelJson = await _users.doc(userCredential.user.uid).get();
      userModel = UserModel().toObject(userModelJson.data());
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return userModel;
  }


}
