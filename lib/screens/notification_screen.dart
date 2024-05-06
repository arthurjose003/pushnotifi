import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
 // static const route='/notification_screen';

  @override
  Widget build(BuildContext context) {
    final message=ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return Scaffold(
      appBar: AppBar(title:const Text("App notification"),),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:

        [


          Text(message.notification!.title.toString(),style:const TextStyle(fontSize: 30),),
          Text(message.notification!.body.toString(),style:const TextStyle(fontSize: 19) ),
         // Text(message.data.toString()),
        ],),
      )

    );
  }
}
