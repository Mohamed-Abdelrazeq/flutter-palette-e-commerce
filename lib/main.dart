import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:multivender_ecommerce_app/Models/UserModel.dart';
import 'Models/CategoryModel.dart';
import 'Models/OrderModel.dart';
import 'Models/OwnerModel.dart';
import 'Models/ProductModel.dart';
import 'Models/StatusModel.dart';
import 'Models/StoreModel.dart';

import 'Views/FutureReturn/Loading.dart';
import 'Views/FutureReturn/SomethingWentWrong.dart';
import 'Views/Screens/HomePage.dart';
import 'Views/Screens/WelcomePage.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }
        if (snapshot.connectionState == ConnectionState.done) {

          ProductModel someProduct = ProductModel(
              name: "ProductName",
              description: "Product Description",
              image1URL: "image1URL",
              image2URL: "image2URL",
              image3URL: "image3URL",
              price: 22,
              store: StoreModel(
                  name: "StoreName",
                  bio: "bio",
                  owner: OwnerModel(
                      name: "ownerName",
                      lon: 22,
                      lat: 44,
                      address: "address",
                      mobile: "01555244006",
                      mail: "mail"),
                  shippingCost: 10),
              category: Category().plant,
              status: Status().stock,
              available: true);

          UserModel someUser = UserModel(name: "UserName3", mail: "UserMail", mobile: "UserMobile", lat: 22, lon: 22);

          OrderModel someOrder = OrderModel(
            product : someProduct,
            user : someUser,
            quantity : 50,
            status : Status().waiting,
            comment : "comment",
            totalPrice : 24,
            orderingDate : DateTime.now(),
          );

          OrderModel().readOrdersByOwnerMail("mail");

          return MaterialApp(
            routes: {
              '/MyHomePage': (context) => HomePage(),
            },
            home: WelcomePage(),
          );
        }
        return Loading();
      },
    );
  }
}
