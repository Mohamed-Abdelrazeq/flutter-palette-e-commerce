import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCredController extends ChangeNotifier{
  UserCredential userCredential;
  bool state;

  setUserCredential(UserCredential currentUserCredential)async{
    userCredential = currentUserCredential;
    print(currentUserCredential);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("logged", true);
    notifyListeners();
  }

  setState(bool newState){
    state = newState;
    notifyListeners();
  }

}