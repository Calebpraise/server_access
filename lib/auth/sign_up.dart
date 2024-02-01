import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:server_access/homescreen.dart';

import 'login_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  Future<void> signUp(String username, String email, String password) async {
    final String apiUrl = 'https://server.pepethesol.com/api/auth/signup';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': username,
          'email': email,
          'password': password,
        }),
      );

      var responseData = jsonDecode(response.body);

      if (response.statusCode == 201) {
        // Successful sign-up
        print('Sign-up successful!');
        print('Response: ${response.body}');
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const Login_screen(),
          ),
        );
      } else {
        // Handle sign-up failure
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(responseData['message']),
        ));
        print('Failed to sign up. Status code: ${response.statusCode}');
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
    return BlurryModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Center(
                    child: Text(
                  'Create Account',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                )),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Name',
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
                    height: 40,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF7F1FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                    ),
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        // labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70),
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
                    height: 40,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF7F1FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        // labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70),
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
                    height: 40,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF7F1FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                    ),
                    child: TextField(
                      controller: passWordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        // labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    // Show loading indicator
                    // ...

                    // final result = await

                    setState(() {
                      isLoading = true;
                    });

                    signUp(nameController.text, emailController.text,
                            passWordController.text)
                        .then((value) {
                      setState(() {
                        isLoading = false;
                      });
                      return null;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF985ACE),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      child: const Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'HelveticaNeue',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70),
                  child: Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 38,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFF985ACE)),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Image.asset('assets/google.png'),
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            ' Contiue with Google',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'HelveticaNeue',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
