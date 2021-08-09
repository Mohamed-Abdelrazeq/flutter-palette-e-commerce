import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Controllers/UserCredController.dart';
import 'Controllers/SearchResultsDisplayController.dart';
import 'Models/UserModel.dart';
import 'Views/Screens/LoginPage.dart';
import 'Views/Screens/RegisterPage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Controllers/CurrentProductRateController.dart';
import 'Controllers/ImagePickerController.dart';
import 'Controllers/LocationController.dart';
import 'Controllers/ThemeController.dart';
import 'Views/FutureReturn/Loading.dart';
import 'Views/FutureReturn/SomethingWentWrong.dart';
import 'Views/Screens/AddPhoneNumber.dart';
import 'Views/Screens/Categories.dart';
import 'Views/Screens/NavPage.dart';
import 'Views/Screens/Products.dart';
import 'Views/Screens/WelcomePage.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeController>(create: (_) => ThemeController()),
        ChangeNotifierProvider<LocationController>(create: (_) => LocationController()),
        ChangeNotifierProvider<ImagePickerController>(create: (_) => ImagePickerController()),
        ChangeNotifierProvider<UserCredController>(create: (_) => UserCredController()),
        ChangeNotifierProvider<CurrentProductRateController>(create: (_) => CurrentProductRateController()),
        ChangeNotifierProvider<SearchResultDisplayController>(create: (_) => SearchResultDisplayController()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    Future _startHandler() async {
      await _initialization;
      if (Provider.of<LocationController>(context,listen: false).getCurrentLocationLat == null){
        await Provider.of<LocationController>(context,listen: false).getCurrentCoordinates();
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      try{
        bool currentState = prefs.getBool("logged");
        String uid = prefs.getString("uid");
        UserModel userModel = await UserModel().getUserDataByUID(uid);
        Provider.of<UserCredController>(context,listen: false).setUserCredential(userModel);
        if (currentState != null){
          if(currentState){
            Provider.of<UserCredController>(context,listen: false).setState(true);
          }
        }
      } catch (e){
        print(e);
      }
    }
    return FutureBuilder(
      future: _startHandler(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("///////////////////");
          print(snapshot.error.toString());
          CollectionReference errors = FirebaseFirestore.instance.collection('errors');
          Future<void> addUser() {
            return errors
                .add({
              'errors': snapshot.error
            })
                .then((value) => print("User Added"))
                .catchError((error) => print("Failed to add user: $error"));
          }
          addUser();
          return MaterialApp(
            home: Padding(
              padding: EdgeInsets.only(top: 50),
              child: SingleChildScrollView(
                child: Text(
                  snapshot.error.toString()
                ),
              ),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return ScreenUtilInit(
            designSize: Size(375, 667),
            builder: () => MaterialApp(
              theme: ThemeData(
                fontFamily: "Roboto"
              ),
              routes: {
                '/NavPage': (context) => NavPage(),
                '/RegisterPage': (context) => RegisterPage(),
                '/LoginPage': (context) => LoginPage(),
                '/Categories' : (context) => Categories(),
                '/Products' : (context) => Products(),
                '/WelcomePage' : (context) => WelcomePage(),
                '/AddPhoneNumber' : (context) => AddPhoneNumber(),
              },
              home: Provider.of<UserCredController>(context).state == true ? NavPage() : WelcomePage(),
            ),
          );
        }
        return Loading();
      },
    );



  }
}

