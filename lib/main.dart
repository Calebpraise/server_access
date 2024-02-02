import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:server_access/constants.dart';
import 'package:server_access/homescreen.dart';
import 'package:server_access/auth/login_screen.dart';
import 'package:server_access/splash.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_options.dart';
import 'package:rxdart/rxdart.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// TODO: Add stream controller

final _messageStreamController = BehaviorSubject<RemoteMessage>();
// TODO: Define the background message handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
    print('Message data: ${message.data}');
    print('Message notification: ${message.notification?.title}');
    print('Message notification: ${message.notification?.body}');
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // TODO: Request permission
  final messaging = FirebaseMessaging.instance;

  final settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (kDebugMode) {
    print('Permission granted: ${settings.authorizationStatus}');
  }
  const vapidKey = "BI50K7V7Sb8_FytPPwPWETJHMcvmHLVIVrWCIdmImvxHuP";

  // TODO: Set up foreground message handler

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.notification != null) {
      // print("object");
      Get.snackbar(message.notification!.title.toString(),
          message.notification!.body.toString(),
          snackPosition: SnackPosition.TOP,
          // borderColor: Colors.grey,
          icon: Image.asset("assets/logo.jpeg"));
    }

    // print("object2");

    // if (kDebugMode) {
    //   print('Handling a foreground message: ${message.messageId}');
    //   print('Message data: ${message.data}');
    //   print('Message notification: ${message.notification?.title}');
    //   print('Message notification: ${message.notification?.body}');
    // }

    _messageStreamController.sink.add(message);
  });

  // TODO: Set up background message handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  String _lastMessage = "";

  _MyAppState() {
    _messageStreamController.listen((message) {
      setState(() {
        if (message.notification != null) {
          _lastMessage = 'Received a notification message:'
              '\nTitle=${message.notification?.title},'
              '\nBody=${message.notification?.body},'
              '\nData=${message.data}';
        } else {
          _lastMessage = 'Received a data message: ${message.data}';
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        debugShowCheckedModeBanner: false, home: Login_screen());
  }
}
