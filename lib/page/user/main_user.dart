import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:minipro2app/page/user/list/List1.dart';
import 'package:minipro2app/page/user/send/send.dart';
import 'package:minipro2app/page/widgets/drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class MainDrawerPage extends StatefulWidget {
  const MainDrawerPage({super.key});

  @override
  State<MainDrawerPage> createState() => _MainDrawerPageState();
}

class _MainDrawerPageState extends State<MainDrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'หน้าหลัก',
            style: GoogleFonts.kanit(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 162, 13, 13),
            ),
          ),
        ),
        centerTitle: true, // ย้าย title ไปไว้ตรงกลาง
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundImage:
                  AssetImage('assets/images/cat.png'), // ใส่เส้นทางของรูปภาพ
            ),
            onPressed: () {
              log("Image tapped!");
            },
          ),
        ],
      ),
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          // ลดระยะห่างให้เส้นชิดขอบด้านบนมากขึ้น
          const SizedBox(height: 10), // ลดระยะห่างจากขอบด้านบน
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 400, // กำหนดความยาวของเส้น
                child: const Divider(
                  color: Color.fromARGB(255, 100, 95, 95), // สีของเส้น
                  thickness: 0.5, // ความหนาของเส้น
                  height: 1, // ความสูงของเส้น
                ),
              ),
            ],
          ),
          const SizedBox(height: 40), // เพิ่มระยะห่างหลังเส้น

          // ปุ่ม "ส่งพัสดุ" และ "รายการพัสดุ"
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // จัดให้อยู่ตรงกลาง
              children: [
                // ปุ่ม "ส่งพัสดุ"
                SizedBox(
                  width: 300, // กำหนดความกว้างของปุ่ม
                  height: 60, // กำหนดความสูงของปุ่ม
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Send()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      textStyle: GoogleFonts.kanit(
                        fontSize: 18,
                      ),
                    ),
                    child: Text(
                      'ส่งพัสดุ',
                      style: GoogleFonts.kanit(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 12, 24, 68),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                // ปุ่ม "รายการพัสดุ"
                SizedBox(
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const List1()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      textStyle: GoogleFonts.kanit(
                        fontSize: 18,
                      ),
                    ),
                    child: Text(
                      'รายการพัสดุ',
                      style: GoogleFonts.kanit(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 162, 13, 13),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
