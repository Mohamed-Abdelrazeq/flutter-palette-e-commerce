import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> register({String mail, String password, String phone}) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: mail, password: phone);
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

  Future<void> login({String mail, String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: mail, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
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


}
