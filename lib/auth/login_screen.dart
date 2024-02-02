import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:server_access/auth/forget_screen.dart';
import 'package:server_access/auth/sign_up.dart';
import 'package:server_access/constants.dart';
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

  bool isLoading = false;

  Future<void> signIn(String email, password) async {
    final String apiUrl = 'https://server.pepethesol.com/api/auth/signin';

    try {
      print("Login in");
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
          "authorization": "Bearer ${Constants.store.read("AUTHTOKEN")}"
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
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

        await Constants.store.write("EMAIL", email);

        await Constants.store.write("AUTHTOKEN", responseData["token"]);

        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const HomeScreen(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(responseData['message']),
        ));
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
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        duration: const Duration(seconds: 5),
      ));
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String _lastMessage = "";
    return BlurryModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Text('Last message from Firebase Messaging:',
                //     style: Theme.of(context).textTheme.titleSmall),
                // Text(_lastMessage,
                //     style: Theme.of(context).textTheme.bodySmall),
                // const SizedBox(
                //   height: 60,
                // ),
                const Center(
                  //ogin
                  child: Text(
                    'ログイン',
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
                    //Email
                    child: Text(
                      'Eメール',
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
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 72),
                  child: Align(
                    alignment: Alignment.topLeft,
                    //password
                    child: Text(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 59),
                  child: Row(
                    children: [
                      Checkbox(
                        value: isTricked,
                        onChanged: (bool? value) {
                          setState(() {
                            isTricked = value ?? false;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        //remember
                        child: Text(
                          ' 覚えて',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isLoading = true;
                    });

                    signIn(textEditingController.text.toString(),
                            passWordController.text.toString())
                        .then((value) {
                      setState(() {
                        isLoading = false;
                      });
                      return null;
                    });
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
                      //login
                      child: Text(
                        'ログイン',
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
                        builder: (BuildContext context) =>
                            const ForgetPassword(),
                      ),
                    );
                  },
                  //forget password
                  child: const Text(
                    'パスワードを忘れた場合',
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const SignUpScreen(),
                      ),
                    );
                  },
                  child: Center(
                    child: RichText(
                        text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: const [
                        //Already have an account?
                        TextSpan(
                          text: 'すでにアカウントをお持ちですか？ ',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        //create account
                        TextSpan(
                          text: 'アカウントを作成する',
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
        ),
      ),
    );
  }
}
