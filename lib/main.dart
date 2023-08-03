//Sharee ganeshay nam
import 'package:father_office_project/pages/first_page.dart';
import 'package:father_office_project/password2/home_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:First_Page(),
    );
  }
}

// sky blue= Color(0xffB5C0FF),
// nevy blue=Color(0xff152228),