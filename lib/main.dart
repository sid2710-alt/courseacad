import 'package:courseacademy/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context,child)=> const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),

    ));

  }
}

