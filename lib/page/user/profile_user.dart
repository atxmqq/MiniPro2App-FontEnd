import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minipro2app/page/widgets/drawer.dart'; // นำเข้า Drawer ของผู้ใช้
import 'package:minipro2app/page/user/edit_profile_user.dart'; // นำเข้าหน้า EditProfileUser

class ProfileUser extends StatelessWidget {
  const ProfileUser({super.key});

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
              backgroundImage: AssetImage('assets/images/m.png'),
            ),
            onPressed: () {
              log("Image tapped!"); // Log เมื่อคลิกที่รูป
            },
          ),
        ],
      ),
      drawer: const DrawerWidget(), // Drawer ของผู้ใช้
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
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
                        AssetImage('assets/images/cat.png'), // รูปโปรไฟล์
                  ),
                ),
                const SizedBox(height: 20),
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
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // จัดให้ข้อความบน-ล่างตรงกัน
                        children: [
                          Text(
                            'ที่อยู่ ', // คำว่า "ที่อยู่"
                            style: GoogleFonts.kanit(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                              width:
                                  90), // ระยะห่างระหว่างคำว่า "ที่อยู่" กับข้อมูล
                          Expanded(
                            // ใช้ Expanded เพื่อให้ข้อความยืดเต็มพื้นที่ที่เหลือ
                            child: Text(
                              'โกโก หน้ามอ หน้าป้าย อำเภอกันทรวิชัย มหาสารคาม 44444', // ข้อมูลที่อยู่
                              style: GoogleFonts.kanit(
                                fontSize: 16,
                              ),
                              softWrap:
                                  true, // ให้ตัดบรรทัดอัตโนมัติเมื่อเกินพื้นที่
                              overflow: TextOverflow
                                  .visible, // กำหนดให้แสดงข้อมูลครบถ้วน
                            ),
                          ),
                        ],
                      )
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
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfileUser(),
                      ),
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

  // ฟังก์ชันสำหรับสร้าง Row แต่ละรายการ
  Widget _buildRow(String label, String value) {
    return Row(
      children: [
        Text(
          '$label ', // Label เช่น "ชื่อ"
          style: GoogleFonts.kanit(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 65), // ปรับระยะห่างระหว่าง Label และค่า
        Text(
          value, // Value เช่น "John Doe"
          style: GoogleFonts.kanit(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
