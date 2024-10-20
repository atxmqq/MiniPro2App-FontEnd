import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:minipro2app/page/rider/edit_profile_rider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minipro2app/page/widgets/drawer.dart';

class ProfileRider extends StatelessWidget {
  const ProfileRider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'โปรไฟล์',
            style: GoogleFonts.kanit(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 162, 13, 13),
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundImage:
                  AssetImage('assets/images/m.png'), // ใส่เส้นทางของรูปภาพ
            ),
            onPressed: () {
              log("Image tapped!");
            },
          ),
        ],
      ),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            // เนื้อหาหลักของโปรไฟล์
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  color: Color.fromARGB(255, 100, 95, 95),
                  thickness: 0.5,
                  height: 1,
                ),
                const SizedBox(height: 30),
                const Center(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage:
                        AssetImage('assets/images/cat.png'), // ใส่รูปภาพโปรไฟล์
                  ),
                ),
                const SizedBox(height: 20),
                // ใช้ Padding เพื่อขยับข้อมูลไปทางขวา
                Padding(
                  padding:
                      const EdgeInsets.only(left: 60.0), // ขยับข้อมูลไปทางขวา
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'ชื่อ ', // คำว่า "ชื่อ"
                            style: GoogleFonts.kanit(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                              width:
                                  100), // เว้นระยะห่างระหว่างคำว่า "ชื่อ" กับ "John Doe"
                          Text(
                            'John Doe', // ข้อมูลชื่อผู้ใช้
                            style: GoogleFonts.kanit(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                          height:
                              15), // เว้นระยะห่างมากขึ้นระหว่างชื่อและเบอร์โทร
                      Row(
                        children: [
                          Text(
                            'เบอร์โทร ', // คำว่า "เบอร์โทร"
                            style: GoogleFonts.kanit(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                              width:
                                  65), // เว้นระยะห่างระหว่างคำว่า "เบอร์โทร" กับเบอร์จริง
                          Text(
                            '012-3456789', // ข้อมูลเบอร์โทรผู้ใช้
                            style: GoogleFonts.kanit(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                          height:
                              15), // เว้นระยะห่างมากขึ้นระหว่างเบอร์โทรและป้ายทะเบียน
                      Row(
                        children: [
                          Text(
                            'ป้ายทะเบียน ', // คำว่า "ป้ายทะเบียน"
                            style: GoogleFonts.kanit(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                              width:
                                  42), // เว้นระยะห่างระหว่างคำว่า "ป้ายทะเบียน" กับป้ายทะเบียนจริง
                          Text(
                            '1234 ABC', // ข้อมูลป้ายทะเบียนรถ
                            style: GoogleFonts.kanit(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Divider(
                  color: Color.fromARGB(255, 100, 95, 95),
                  thickness: 0.5,
                  height: 1,
                ),
              ],
            ),
            // ปุ่มแก้ไขข้อมูลอยู่ด้านล่างขวา
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 20), // ระยะห่างจากด้านล่าง
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const EditProfileRider()), // นำทางไปยังหน้า EditProfileUser
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 12, 24, 68),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                  ),
                  child: Text(
                    'แก้ไขข้อมูล',
                    style: GoogleFonts.kanit(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
