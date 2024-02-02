import 'dart:convert';

import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:server_access/constants.dart';
import 'package:server_access/data/noti.dart';
import 'package:http/http.dart' as http;

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool isLoading = false;
  Future<void> modifynotification(id, permission) async {
    print(id + "   " + permission);
    try {
      print("modifying");
      final response = await http.post(
        Uri.parse("https://server.pepethesol.com/api/notification/"),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
          "authorization": "Bearer ${Constants.store.read("AUTHTOKEN")}"
        },
        body: json.encode({"notification_id": id, "permission": permission}),
      );

      var responseData = jsonDecode(response.body);

      print(responseData);

      if (response.statusCode == 200) {
        setState(() {
          if (permission == "allow") {
            history.firstWhere((element) => element.id == id).isAccepted = true;
          } else {
            history.firstWhere((element) => element.id == id).isAccepted =
                false;
          }
        });
      } else {}
    } catch (e) {}
  }

  onClick({required bool isAcceptReject, id}) {
    setState(() {
      isLoading = true;
    });

    modifynotification(id, isAcceptReject ? "allow" : "disallow")
        .then((value) => setState(() {
              isLoading = false;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: history.where((element) => element.isAccepted == null).isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset("assets/formkit.png"),
                const Text(
                  '何も見せられない\n現時点で',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF525151),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
              ],
            )

          //       BlurryModalProgressHUD(
          // inAsyncCall: isLoading,
          // color: Colors.transparent,
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  if (isLoading)
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(),
                    ),
                  ...history
                      .where((element) => element.isAccepted == null)
                      .map((e) => Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      e.image,
                                      fit: BoxFit.fill,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              e.name,
                                              style: const TextStyle(
                                                color: Color(0xFF525151),
                                                fontSize: 12,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            e.serverName,
                                            style: const TextStyle(
                                              color: Color(0xFF525151),
                                              fontSize: 14,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [Text(e.time), Text(e.country)],
                                    )
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25),
                                child: Divider(
                                  thickness: 1,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          onClick(
                                              isAcceptReject: false, id: e.id);
                                        },
                                        child: Image.asset('assets/bold.png')),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        onClick(
                                            isAcceptReject: false, id: e.id);
                                      },
                                      child: const Text(
                                        '拒否する',
                                        style: TextStyle(
                                          color: Color(0xFF525151),
                                          fontSize: 14,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                        onTap: () {
                                          onClick(
                                              isAcceptReject: true, id: e.id);
                                        },
                                        child:
                                            Image.asset('assets/Vector.png')),
                                    GestureDetector(
                                      onTap: () {
                                        onClick(isAcceptReject: true, id: e.id);
                                      },
                                      child: const Text(
                                        '受け入れる',
                                        style: TextStyle(
                                          color: Color(0xFF525151),
                                          fontSize: 14,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 120,
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                            ],
                          ))
                      .toList()
                ],
              ),
            ),
    );
  }
}
