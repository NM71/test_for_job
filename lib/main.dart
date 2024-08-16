// // import 'package:flutter/material.dart';
// // import 'package:test_for_job/screens/home_screen.dart';
// //
// // void main() {
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: HomeScreen(),
// //     );
// //   }
// // }
//
//
//
// import 'package:flutter/material.dart';
// import 'package:test_for_job/screens/home_screen.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'CHANCE App',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: HomeScreen(),
//     );
//   }
// }
//
//
//
//
//































import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:test_for_job/screens/create_post.dart';
import 'package:test_for_job/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'OpenSans'),
      debugShowCheckedModeBanner: false,
      title: 'CHANCE App',
      home: HomeScreen(),
    );
  }
}

