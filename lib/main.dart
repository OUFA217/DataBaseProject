import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:studentsystem/pages/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0XFF584BDD),
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'STUDENT SYSTEM',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Color(0XFF584BDD),
        hintColor: Color(0XFFFBF6FF),
      ),
      home: Dashboard(),
    );
  }
}
