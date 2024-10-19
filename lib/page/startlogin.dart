import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minipro2app/page/widgets/appbar.dart';

class StartLogin extends StatefulWidget {
  const StartLogin({super.key});

  @override
  State<StartLogin> createState() => _StartLogin();
}

class _StartLogin extends State<StartLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 12, 24, 68), // สีพื้นหลังที่กำหนด
      body: Center(
        child: Image.asset(
          'assets/images/m.png',
          width: 300,
          height: 300,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
