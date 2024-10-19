import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:minipro2app/page/user/send/send_product.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minipro2app/page/user/send/add_product.dart';
import 'package:minipro2app/page/widgets/appbar.dart';

class Send extends StatefulWidget {
  const Send({super.key});

  @override
  State<Send> createState() => _SendPage();
}

class _SendPage extends State<Send> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'ส่งพัสดุ'),
      body: Column(
        children: [
          // Divider ใต้ AppBar
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

          // การ์ดที่มีรูปภาพและข้อความ
          Card(
            elevation: 4, // กำหนดเงาให้การ์ด
            margin: const EdgeInsets.all(16), // ระยะห่างรอบการ์ด
            child: Padding(
              padding: const EdgeInsets.all(16), // ระยะห่างภายในการ์ด
              child: Row(
                children: [
                  // รูปภาพ
                  Image.asset(
                    'assets/images/cat.png', // ใส่รูปภาพที่ต้องการแสดง
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 16), // ระยะห่างระหว่างรูปภาพกับข้อความ

                  // ข้อความ
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'แมวเป้า', // ข้อความที่ต้องการแสดง
                          style: GoogleFonts.kanit(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8), // ระยะห่างระหว่างข้อความ
                        Text(
                          'ขี้ดื้อมากเป้ฯตะซังคัก',
                          style: GoogleFonts.kanit(
                            fontSize: 14,
                            color: Colors.grey[700], // สีข้อความ
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Spacer(), // ใช้ Spacer เพื่อดันปุ่มลงไปที่ด้านล่าง

          // Row สำหรับปุ่มที่ต้องการให้เรียงกัน
          Column(
            mainAxisAlignment: MainAxisAlignment.center, // จัดกลาง
            children: [
              // ปุ่ม 1
              SizedBox(
                width: 200, // กำหนดความกว้างของปุ่ม
                height: 40, // กำหนดความสูงของปุ่ม
                child: ElevatedButton(
                  onPressed: () {
                    log("ปุ่ม เพิ่มสินค้า!");
                    // นำทางไปยังหน้า Parcellist
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Addproduct()),
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
                    'เพิ่มสินค้า',
                    style: GoogleFonts.kanit(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 12, 24, 68),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200, // กำหนดความกว้างของปุ่ม
                height: 40, // กำหนดความสูงของปุ่ม
                child: ElevatedButton(
                  onPressed: () {
                    log("ปุ่ม ส่งสินค้า!");
                    // นำทางไปยังหน้า Addproduct
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SendProduct()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 12, 24, 68), // สีน้ำเงินสำหรับปุ่ม
                    foregroundColor: Colors.white, // สีขาวสำหรับข้อความ
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15), // กำหนดความโค้งของมุมปุ่ม
                    ),
                    textStyle: GoogleFonts.kanit(
                      fontSize: 18,
                    ),
                  ),
                  child: Text(
                    'ส่งสินค้า',
                    style: GoogleFonts.kanit(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40), // ระยะห่างด้านล่าง
        ],
      ),
    );
  }
}
