import 'package:flutter/material.dart';

class Alert {
  String name;

  String country;
  String serverName;
  String image;
  String time;
  String? id;
  String? userid;
  bool? isAccepted;

  // Constructor
  Alert({
    required this.name,
    required this.country,
    required this.serverName,
    required this.image,
    required this.time,
    this.id,
    this.userid,
    required this.isAccepted,
  });
}

List<Alert> history = [
  // Alert(
  //     name: "Server Request",
  //     time: "09:00am",
  //     country: "USA",
  //     serverName: "Server 192.687:8080",
  //     image: "assets/Group.png",
  //     isAcceepted: true),
  // Alert(
  //   name: "Server Request",
  //   time: "09:00am",
  //   country: "USA",
  //   serverName: "Server 192.687:8080",
  //   image: "assets/Group.png",
  //   isAcceepted: false,
  // ),
  // Alert(
  //   name: "Server Request",
  //   time: "09:00am",
  //   country: "USA",
  //   serverName: "Server 192.687:8080",
  //   image: "assets/Group.png",
  //   isAcceepted: null,
  // )
];

// List<Alert> notifications = [
//   // Alert(
//   //     name: "警告: サーバーアクセス",
//   //     time: "09:00am",
//   //     country: "USA",
//   //     serverName: "サーバ 192.687:8080",
//   //     image: "assets/Ellipse.png",
//   //     isAccepted: true),
//   // Alert(
//   //   name: "警告: サーバーアクセス",
//   //   time: "09:00am",
//   //   country: "USA",
//   //   serverName: "サーバ 192.687:8080",
//   //   image: "assets/Group.png",
//   //   isAccepted: false,
//   // ),
//   // Alert(
//   //   name: "警告: サーバーアクセス",
//   //   time: "09:00am",
//   //   country: "USA",
//   //   serverName: "サーバ 192.687:8080",
//   //   image: "assets/Group.png",
//   //   isAccepted: null,
//   // )
// ];
