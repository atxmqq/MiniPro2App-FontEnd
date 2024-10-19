import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minipro2app/maindrawer.dart';
import 'package:minipro2app/page/register.dart';
import 'package:minipro2app/page/startlogin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Flutter Demo',
      home: StartLogin(),
    );
  }
}
