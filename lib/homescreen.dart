import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:server_access/constants.dart';
import 'package:server_access/data/noti.dart';
import 'package:server_access/firebase_options.dart';

import 'data/page 1.dart';
import 'history_screen.dart';

import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isNotification = true;

  Future<void> watch() async {
    String? token;
    const vapidKey = "BI50K7V7Sb8_FytPPwPWETJHMcvmHLVIVrWCIdmImvxHuP";
    final messaging = FirebaseMessaging.instance;
    if (DefaultFirebaseOptions.currentPlatform == DefaultFirebaseOptions.web) {
      token = await messaging.getToken(
        vapidKey: vapidKey,
      );
    } else {
      token = await messaging.getToken();
    }

    print('Registration Token=$token');

    try {
      // print("Login in");
      final response = await http.post(
        Uri.parse("https://server.pepethesol.com/api/watch/"),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
          "authorization": "Bearer ${Constants.store.read("AUTHTOKEN")}"
        },
        body: json.encode({"fcm_token": token}),
      );

      var responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Successful sign-in, handle the response accordingly
        if (kDebugMode) {
          print('Signed in successfully!');
        }
        if (kDebugMode) {
          print('Response: ${response.body}');
        }
      } else {
        // Handle sign-in failure
        if (kDebugMode) {
          print('Failed to sign in. Status code: ${response.statusCode}');
        }
        if (kDebugMode) {
          print('Response: ${response.body}');
        }
      }
    } catch (e) {
      // Handle errors

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.

      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  Future<void> notificationhistory() async {
    try {
      // print("Login in");
      final response = await http.get(
        Uri.parse("https://server.pepethesol.com/api/notification/history"),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
          "authorization": "Bearer ${Constants.store.read("AUTHTOKEN")}"
        },
      );

      var responseData = jsonDecode(response.body);

      print(responseData);

      if (response.statusCode == 200) {
        history.clear();
        for (var element in responseData['notifications']) {
          setState(() {
            history.add(Alert(
              country: element['country'],
              image: "assets/Group.png",
              isAccepted: element["permission"] == null
                  ? null
                  : element["permission"] == "allow"
                      ? true
                      : false,
              name: "Alert: Server Access",
              serverName: "Server ${element['ip_address']}",
              id: element["id"],
              userid: element["user_id"],
              time: DateFormat('h:mm a')
                  .format(DateTime.parse(element['createdAt'])),
            ));
          });
        }
      } else {}
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  @override
  void initState() {
    watch();
    notificationhistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'サーバーアクセス',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF1E1E1E),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isNotification = true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: isNotification ? 50 : 20, vertical: 10),
                      decoration: ShapeDecoration(
                        color: isNotification
                            ? const Color(0xFFE8E8E8)
                            : Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        '通知',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF525151),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // notificationhistory();
                      // print("Bearer ${Constants.store.read("AUTHTOKEN")}");
                      setState(() {
                        isNotification = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: isNotification == false ? 50 : 20,
                          vertical: 10),
                      decoration: ShapeDecoration(
                        color: isNotification == false
                            ? const Color(0xFFE8E8E8)
                            : Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        '歴史',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF525151),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              thickness: 2,
              color: Colors.grey,
            ),
            isNotification ? const Notifications() : const HistoryScreen()
          ]),
        ),
      ),
    );
  }
}
