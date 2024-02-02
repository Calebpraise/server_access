import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:server_access/constants.dart';

import 'login_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NewPassword extends StatefulWidget {
  final String otpfrom;
  const NewPassword({super.key, required this.otpfrom});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  TextEditingController newpController = TextEditingController();
  TextEditingController newpassController = TextEditingController();

  bool isLoading = false;

  Future<void> resetPasswoed(
    String password,
    String confirmpassword,
  ) async {
    final String apiUrl = 'https://server.pepethesol.com/api/auth/reset';

    print("reset password");

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          "authorization": "Bearer ${Constants.store.read("AUTHTOKEN")}"
        },
        body: json.encode({
          'otp': widget.otpfrom,
          'password': password,
          'confirm_password': confirmpassword,
        }),
      );

      var responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Successful sign-up
        print('OTP SENT');
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
        print('Incorrect Pin. Status code: ${response.statusCode}');
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
        appBar: AppBar(
          title: const Center(
            child: Text(
              //New Password
              '新しいパスワード',
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
                height: 90,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 72),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    //new password
                    '新しいパスワード',
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
                  height: 65,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF7F1FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: newpController,
                        decoration: const InputDecoration(
                          //      suffixIcon: Image.asset("assets/Group 1.png") ,
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 72),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    //password
                    'パスワード',
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
                  height: 65,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF7F1FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: newpassController,
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
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isLoading = true;
                    });

                    resetPasswoed(newpController.text.toString(),
                            newpassController.text.toString())
                        .then((value) {
                      setState(() {
                        isLoading = false;
                      });
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
                        //send
                        '送信',
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
