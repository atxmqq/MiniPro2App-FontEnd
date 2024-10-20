import 'dart:developer'; // สำหรับการใช้งาน log()
import 'package:flutter/material.dart';
import 'package:minipro2app/page/rider/main_rider.dart';
import 'package:minipro2app/page/rider/profile_rider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minipro2app/page/login.dart'; // นำเข้าหน้า login.dart

class DrawerWidgetRider extends StatelessWidget {
  const DrawerWidgetRider({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 0, 10),
        child: Column(
          children: [
            const SizedBox(height: 100), // เพิ่มระยะห่างจากด้านบน
            const Center(
              child: CircleAvatar(
                radius: 70, // ขนาดของรูปภาพ
                backgroundImage:
                    AssetImage('assets/images/cat.png'), // ใส่รูปจาก assets
              ),
            ),
            const SizedBox(height: 50),

            // ทำให้คำว่า "เมนู" อยู่ตรงกลาง
            ListTile(
              title: Center(
                child: Text(
                  'เมนู',
                  style: GoogleFonts.kanit(
                    fontWeight: FontWeight.bold,
                    fontSize: 20, // ปรับขนาดฟอนต์ตามต้องการ
                  ),
                ),
              ),
            ),

            // ListTile หน้าหลัก
            ListTile(
              title: Row(
                children: [
                  const Image(
                    image: AssetImage('assets/icon/home.png'),
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(
                      width: 16), // เพิ่มระยะห่างระหว่างไอคอนกับข้อความ
                  Text(
                    'หน้าหลัก',
                    style: GoogleFonts.kanit(), // ใช้ฟอนต์ Kanit
                  ),
                ],
              ),
              onTap: () {
                log('home rider');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MainRider()),
                );
              },
            ),

            // ListTile โปรไฟล์
            ListTile(
              title: Row(
                children: [
                  const Image(
                    image: AssetImage('assets/icon/user.png'),
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'โปรไฟล์',
                    style: GoogleFonts.kanit(), // ใช้ฟอนต์ Kanit
                  ),
                ],
              ),
              onTap: () {
                log('profile rider');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileRider()),
                );
              },
            ),

            // ListTile ออกจากระบบ
            ListTile(
              title: Row(
                children: [
                  const Image(
                    image: AssetImage('assets/icon/out.png'),
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'ออกจากระบบ',
                    style: GoogleFonts.kanit(), // ใช้ฟอนต์ Kanit
                  ),
                ],
              ),
              onTap: () {
                log('Logging out and navigating to Login');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
