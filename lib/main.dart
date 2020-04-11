import 'package:ckcstudent/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(CKCStudentApp());

class CKCStudentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MaterialApp(
      title: "CKC STUDENTS",
      theme: ThemeData(primaryColor: Colors.blue),
      home: HomePage(),
    );
  }
}
