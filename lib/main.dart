import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Models/OwnerModel.dart';
import 'Models/ProductModel.dart';
import 'Models/StoreModel.dart';
import 'package:provider/provider.dart';

import 'Views/FutureReturn/Loading.dart';
import 'Views/FutureReturn/SomethingWentWrong.dart';
import 'Views/Screens/HomePage.dart';
import 'Views/Screens/WelcomePage.dart';

import 'Enums.dart';

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

          ProductModel myProduct = ProductModel(
              name: "Product 1",
              description: "Product Description",
              image1URL: "image1URL",
              image2URL: "image2URL",
              image3URL: "image3URL",
              price: 22,
              store: StoreModel(
                  name: "Store 1",
                  bio: "bio",
                  owner: OwnerModel(
                      name: "name",
                      lon: 22,
                      lat: 44,
                      address: "address",
                      mobile: "01555244006",
                      mail: "mail"),
                  shippingCost: 10),
              category: MyCategory.Art,
              status: Status.Stock,
              available: true);

          myProduct.addProduct();

          print(myProduct.id);

          myProduct.updateProduct(key : "name" , value : "Newest Name");

          // myProduct.deleteProduct();

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
