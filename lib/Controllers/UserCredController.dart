import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCredController extends ChangeNotifier{
  UserModel userModel;
  bool state;

  setUserCredential(UserModel currentUserModel)async{
    userModel = currentUserModel;
    if(currentUserModel != null){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool("logged", true);
      await prefs.setString('uid', userModel.uid);
      notifyListeners();
    }
  }

  setState(bool newState){
    state = newState;
    notifyListeners();
  }

  setPhone(String phoneNumber)async{
    userModel.mobile = phoneNumber;
    await userModel.addPhoneNumber();
    notifyListeners();
  }

}