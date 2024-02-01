import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:server_access/auth/confirm.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController forgetController = TextEditingController();
  bool isLoading = false;

  Future<void> forgotPassword(
    String email,
  ) async {
    print(email);

    // Navigator.push(
    //   context,
    //   MaterialPageRoute<void>(
    //     builder: (BuildContext context) => const Confirm(),
    //   ),
    // );

    final String apiUrl = 'https://server.pepethesol.com/api/auth/forgot';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
        }),
      );

      var responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Successful sign-up
        print('A link has been sent to your gmail!');
        print('Response: ${response.body}');
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const Confirm(),
          ),
        );
      } else {
        // Handle sign-up failure
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(responseData['error']),
        ));
        print('Incorrect email. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      print("error");
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
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Forget Password',
              style: TextStyle(color: Colors.black),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 160,
              ),
              const Center(
                child: Text(
                  'Enter Email Address',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF7F1FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                  ),
                  child: Center(
                    child: TextField(
                      controller: forgetController,
                      obscureText: false,
                      decoration: const InputDecoration(
                        // labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: GestureDetector(
                  onTap: () async {
                    // Show loading indicator
                    // ...

                    // final result = await

                    if (mounted) {
                      setState(() {
                        isLoading = true;
                      });
                    }

                    forgotPassword(
                      forgetController.text,
                    ).then((value) {
                      if (mounted) {
                        setState(() {
                          isLoading = false;
                        });
                      }

                      return null;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 38,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF985ACE),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                    ),
                    child: const Center(
                      child: Text(
                        'send',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
