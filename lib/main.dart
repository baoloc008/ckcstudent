import 'package:ckcstudent/pages/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(CKCStudentApp());

class CKCStudentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CKC STUDENTS",
      theme: ThemeData(primaryColor: Colors.blue),
      home: HomePage(),
    );
  }
}
