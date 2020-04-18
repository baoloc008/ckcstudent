import 'package:ckcstudent/bottom_navigator.dart';
import 'package:ckcstudent/themes/color.dart';
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
      title: 'CKC STUDENTS',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF2F80ED, swatch),
        fontFamily: 'SFCompactDisplay-Regular',
      ),
      home: BottomNavigator(),
    );
  }
}
