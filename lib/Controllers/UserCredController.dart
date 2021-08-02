import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserCredController extends ChangeNotifier{
  UserCredential userCredential;

  setUserCredential(UserCredential currentUserCredential){
    userCredential = currentUserCredential;
    notifyListeners();
  }
}