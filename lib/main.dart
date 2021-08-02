import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multivender_ecommerce_app/Controllers/UserCredController.dart';
import 'package:multivender_ecommerce_app/Views/Screens/LoginPage.dart';
import 'package:multivender_ecommerce_app/Views/Screens/RegisterPage.dart';
import 'package:provider/provider.dart';
import 'Controllers/ImagePickerController.dart';
import 'Controllers/LocationController.dart';
import 'Controllers/ThemeController.dart';
import 'Views/FutureReturn/Loading.dart';
import 'Views/FutureReturn/SomethingWentWrong.dart';
import 'Views/Screens/Categories.dart';
import 'Views/Screens/Details.dart';
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
    }
    return FutureBuilder(
      future: _startHandler(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return SomethingWentWrong();
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
                '/details' : (context) => Details(),
                '/Categories' : (context) => Categories(),
                '/Products' : (context) => Products(),
              },
              home: WelcomePage(),
            ),
          );
        }
        return Loading();
      },
    );



  }
}

//TODO : just some object (do nothing)
// StoreModel someStore = StoreModel(
//     name: "NewStoreName",
//     bio: "bio",
//     owner: OwnerModel(
//         name: "ownerName",
//         lon: 22,
//         lat: 44,
//         address: "address",
//         mobile: "01555244006",
//         mail: "mail"),
//     shippingCost: 10);
// ProductModel someProduct = ProductModel(
//     name: "NewProductName2",
//     description: "Product Description",
//     price: 22,
//     store: someStore,
//     category: Category().plant,
//     status: Status().stock,
//     available: true);
// UserModel someUser = UserModel(name: "UserName3", mail: "UserMail", mobile: "UserMobile", lat: 22, lon: 22);
// OrderModel someOrder = OrderModel(
//   product : someProduct,
//   user : someUser,
//   quantity : 50,
//   status : Status().waiting,
//   comment : "comment",
//   totalPrice : 24,
//   orderingDate : DateTime.now(),
// );
// RateModel someRate = RateModel(from: someUser,to: someProduct,rate: 5);
