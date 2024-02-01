import 'package:flutter/material.dart';
import 'package:server_access/auth/forget_screen.dart';
import 'package:server_access/auth/sign_up.dart';
import 'package:server_access/homescreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login_screen extends StatefulWidget {
  const Login_screen({super.key});

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  bool isTricked = false;
  Future<void> signIn(String email, password) async {
    final String apiUrl = 'https://server.pepethesol.com/api/auth/signin';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'accept: application/json'
              'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Successful sign-in, handle the response accordingly
        print('Signed in successfully!');
        print('Response: ${response.body}');
      } else {
        // Handle sign-in failure
        print('Failed to sign in. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    String _lastMessage = "";
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Text('Last message from Firebase Messaging:',
                style: Theme.of(context).textTheme.titleSmall),
            Text(_lastMessage, style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(
              height: 60,
            ),
            const Center(
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'HelveticaNeue',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 72),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Email',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 64,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF7F1FF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: textEditingController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 72),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Password',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 64,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF7F1FF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: passWordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        // labelText: 'Email',

                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: Checkbox(
                    value: isTricked,
                    onChanged: (bool? value) {
                      setState(() {
                        isTricked = value ?? false;
                      });
                    },
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    ' Remember',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                signIn(textEditingController.text.toString(),
                    passWordController.text.toString());
              },
              child: Container(
                width: 263,
                height: 38,
                decoration: ShapeDecoration(
                  color: const Color(0xFF985ACE),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                ),
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'HelveticaNeue',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 70),
              child: Divider(
                color: Colors.black,
                thickness: 2,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const ForgetPassword(),
                  ),
                );
              },
              child: const Text(
                'Forget Password',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'HelveticaNeue',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: Center(
                child: RichText(
                    text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: const [
                    TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    TextSpan(
                      text: 'Create Account',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}