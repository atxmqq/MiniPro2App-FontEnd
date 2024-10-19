import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:minipro2app/page/regis_rider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minipro2app/page/regis_user.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 12, 24, 68), // พื้นหลังสีกรมเข้ม
      body: Stack(
        // ใช้ Stack เพื่อวางปุ่มกลับในมุมบนซ้าย
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // จัดให้อยู่กลางจอ
              children: [
                Text(
                  'ลงทะเบียน',
                  style: GoogleFonts.kanit(
                    color: Colors.white, // สีตัวอักษรเป็นสีขาว
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/m.png',
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const RegisUser()), // นำทางไป RegisUser
                    );
                  },
                  child: Text(
                    'ผู้ใช้ทั่วไป',
                    style: GoogleFonts.kanit(
                      color: const Color.fromARGB(255, 12, 24, 68),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 15),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const RegisRider()), // นำทางไป RegisRider
                    );
                  },
                  child: Text(
                    'ไรเดอร์',
                    style: GoogleFonts.kanit(
                      color: const Color.fromARGB(255, 12, 24, 68),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // ปุ่มย้อนกลับ
          Positioned(
            top: 40, // ระยะห่างจากขอบด้านบน
            left: 20, // ระยะห่างจากขอบด้านซ้าย
            child: IconButton(
              icon: const Icon(Icons.arrow_back,
                  color: Colors.white), // ไอคอนย้อนกลับ
              onPressed: () {
                Navigator.pop(context); // กลับไปหน้าก่อนหน้า
              },
            ),
          ),
        ],
      ),
    );
  }
}
