import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:minipro2app/page/user/list/list1.dart';
import 'package:minipro2app/page/widgets/appbar.dart';
import 'package:google_fonts/google_fonts.dart';

class List2 extends StatefulWidget {
  const List2({super.key});

  @override
  State<List2> createState() => _List2Page();
}

class _List2Page extends State<List2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'รายการพัสดุ'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, // จัดให้เริ่มต้นที่ด้านบน
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // จัดให้อยู่ตรงกลาง
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
          const SizedBox(height: 20), // ระยะห่างด้านบน
          // Row สำหรับปุ่มที่ต้องการให้เรียงกัน
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // จัดกลาง
            children: [
              // ปุ่ม 1
              SizedBox(
                width: 160, // กำหนดความกว้างของปุ่ม
                height: 40, // กำหนดความสูงของปุ่ม
                child: ElevatedButton(
                  onPressed: () {
                    log("ปุ่ม สินค้าที่จัดส่ง!");
                    // นำทางไปยังหน้า Parcellist
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const List1()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15), // กำหนดความโค้งของมุมปุ่ม
                    ),
                    textStyle: GoogleFonts.kanit(
                      fontSize: 18,
                    ),
                  ),
                  child: Text(
                    'สินค้าที่จัดส่ง',
                    style: GoogleFonts.kanit(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 126, 122, 122),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20), // ระยะห่างระหว่างปุ่ม
              // ปุ่ม 2
              SizedBox(
                width: 160, // กำหนดความกว้างของปุ่ม
                height: 40, // กำหนดความสูงของปุ่ม
                child: ElevatedButton(
                  onPressed: () {
                    log("ปุ่ม 2 สินค้าที่ต้องรับ!");
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15), // กำหนดความโค้งของมุมปุ่ม
                    ),
                    textStyle: GoogleFonts.kanit(
                      fontSize: 18,
                    ),
                  ),
                  child: Text(
                    'สินค้าที่ต้องรับ',
                    style: GoogleFonts.kanit(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 162, 13, 13),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // การ์ดขนาดเล็ก
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10), // ทำให้มุมการ์ดโค้งเล็กลง
            ),
            elevation: 2, // ลดเงาของการ์ดให้เล็กลง
            child: Padding(
              padding: const EdgeInsets.all(10.0), // ลด padding ภายในการ์ด
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // รูปภาพขนาดเล็กลง
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage(
                            'assets/images/cat.png'), // ใส่ที่อยู่รูปภาพที่ต้องการ
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12), // ลดระยะห่างระหว่างรูปภาพกับข้อมูล

                  // คอลัมน์สำหรับชื่อ, เลขพัสดุ, สถานะ
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'kkxpter',
                          style: GoogleFonts.kanit(
                            fontSize: 14, // ลดขนาดฟอนต์
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 162, 13, 13),
                          ),
                        ),
                        const SizedBox(
                            height: 6), // ลดระยะห่างระหว่างแต่ละบรรทัด
                        Text(
                          'เลขพัสดุ: 123456789xxx',
                          style: GoogleFonts.kanit(
                            fontSize: 12,
                            color: Color.fromARGB(255, 126, 122, 122),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'กำลังจัดส่ง',
                          style: GoogleFonts.kanit(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 46, 213, 38),
                          ),
                        ),
                      ],
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      log("กดปุ่มดูสำหรับพัสดุนี้");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // พื้นหลังสีแดง
                      foregroundColor: Colors.white, // ตัวอักษรสีขาว
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6), // ลดขนาด padding ของปุ่ม
                    ),
                    child: Text(
                      'ดู',
                      style:
                          GoogleFonts.kanit(fontSize: 12), // ลดขนาดฟอนต์ในปุ่ม
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
