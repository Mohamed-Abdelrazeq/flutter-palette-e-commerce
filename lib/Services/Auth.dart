import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:multivender_ecommerce_app/Models/UserModel.dart';

class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> register({String mail, String password, String phone,double lng ,double lat}) async {

    UserCredential userCredential;
    try {
      userCredential = await _auth.createUserWithEmailAndPassword(email: mail, password: phone);
      UserModel userModel = UserModel(uid: userCredential.user.uid,mobile: phone, lng:lng, lat: lat);
      userModel.addUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return userCredential;
  }

  Future<UserCredential> login({String mail, String password}) async {
    UserCredential userCredential;
    try {
      userCredential = await _auth.signInWithEmailAndPassword(email: mail, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return userCredential;
  }

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

  Future<UserCredential> signInWithGoogle({double lng ,double lat}) async {
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
    UserModel userModel = UserModel(uid: userCredential.user.uid,mobile: "",lng:lng,lat: lat);
    userModel.addUser();
    // Once signed in, return the UserCredential
    return userCredential;
  }

  Future<UserCredential> signInWithFacebook({double lng ,double lat}) async {
      FacebookAuth.instance.logOut();
      final  result = await FacebookAuth.instance.login();
      final facebookAuthCredential = FacebookAuthProvider.credential(result.token);
      // Once signed in, return the UserCredential
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      UserModel userModel = UserModel(uid: userCredential.user.uid,mobile: "",lng:lng,lat: lat);
      userModel.addUser();
      return userCredential;
  }

}
