// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:ovata/core/utiles/utiles.dart';


// class FBMessging {
//   static Future<void> firebaseMessagingBackgroundHandler(
//       RemoteMessage message) async {
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }

//   static Future<void> initUniLinks() async {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;
//     FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
//     FirebaseMessaging.instance.getInitialMessage().then((value) => null);
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       if (message.notification != null) {
//         // print(
//         //     'Message also contained a notification: ${message.notification!.body}');
//       }
//     });
//     // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
//     //   Map dd = message.data;

//     //   int d = int.parse(message.data["post_id"]);

//     //   Navigator.push(
//     //       navigatorKey.currentState!.context,
//     //       MaterialPageRoute(
//     //           builder: (context) => ProductScreen(
//     //                 productId: d,
//     //                 // wooProduct:wooProduct ,
//     //               )));
//     // });

//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//     // await FirebaseMessaging.instance.subscribeToTopic('supakoto');

//     // print('subscribe to topic');
//     await messaging.getToken().then((tokenFcm) {
//       // print(tokenFcm);
//     Utils.FCMToken = tokenFcm ?? '';
//       // print(Utils.FCMToken);
//     });
//   }
// }
