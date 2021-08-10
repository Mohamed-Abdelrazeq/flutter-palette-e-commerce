import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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
import 'Views/Screens/AddPhoneNumber.dart';
import 'Views/Screens/Categories.dart';
import 'Views/Screens/NavPage.dart';
import 'Views/Screens/Products.dart';
import 'Views/Screens/WelcomePage.dart';



const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeController>(create: (_) => ThemeController()),
        ChangeNotifierProvider<LocationController>(create: (_) => LocationController()),
        ChangeNotifierProvider<ImagePickerController>(create: (_) => ImagePickerController()),
        ChangeNotifierProvider<UserCredController>(create: (_) => UserCredController()),
        ChangeNotifierProvider<CurrentProductRateController>(create: (_) => CurrentProductRateController()),
        ChangeNotifierProvider<SearchResultDisplayController>(create: (_) => SearchResultDisplayController()),
      ],
      child: MyApp(),
    ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body)],
                  ),
                ),
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Future _startHandler() async {
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

