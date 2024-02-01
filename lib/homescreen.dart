import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:server_access/constants.dart';

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
    final String apiUrl = 'https://server.pepethesol.com/api/watch/';

    print("watch");

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          "authorization": "Bearer ${Constants.store.read("AUTHTOKEN")}"
        },
      );

      var responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Successful sign-up
        print('watch get');
        print('Response: ${response.body}');
      } else {
        // Handle sign-up failure
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(responseData['message']),
        ));
        // print('Incorrect Pin. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        duration: Duration(seconds: 5),
      ));
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    // watch();
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
    );
  }
}
