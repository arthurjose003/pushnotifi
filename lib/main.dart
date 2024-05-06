import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:pushno/screens/homepage.dart';
import 'package:pushno/screens/notification_screen.dart';

import 'apifetch/firebase_api.dart';
import 'firebase_options.dart';
final navigatorKey= GlobalKey<NavigatorState>();
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotification();
  await FirebaseMessaging.instance.subscribeToTopic("TPITO");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:const HomePage(),
      navigatorKey: navigatorKey,
      routes: {
       '/notification_screen':(context)=>const NotificationScreen(),
      },
    );
  }
}

