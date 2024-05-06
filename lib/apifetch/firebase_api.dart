import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:pushno/main.dart';
// Future<void>handleBackgroundMessage(RemoteMessage message)async{
//   print('Title${message.notification?.title}');
//   print('Body${message.notification?.body}');
//   print('Payload${message.data}');
//
// }
class FirebaseApi{
  //create an instance of firebase Messaging
  final _firebaseMessaging=FirebaseMessaging.instance;
  // function to initialize notifications
  Future<void> initNotification()async{
    //request permission from user (will prompt user)
    await _firebaseMessaging.requestPermission();
    //fetch the FCM token for this device
    final fCMToken= await _firebaseMessaging.getToken();
    // print the token (normally you would send this to your serves)
    print("heloo");
    print("heloo");
    print("heloo");
    print("heloo");
    print("heloo");
    print("Token:  $fCMToken");
   // FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage)
    initPushNotification();
  }
//function to handle received messages
void handleMessage(RemoteMessage? message){
    if(message==null)return;
    navigatorKey.currentState?.pushNamed("/notification_screen",arguments: message);
}
//function to initialize foreground and background setting
Future initPushNotification()async{
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}