import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:minipro2app/page/user/list/data_product2.dart';
import 'package:minipro2app/page/user/list/map.dart';
import 'package:minipro2app/page/user/send/send.dart';
import 'package:minipro2app/page/widgets/appbar.dart';
import 'package:google_fonts/google_fonts.dart';

class Data_ProductPage extends StatefulWidget {
  const Data_ProductPage({super.key});

  @override
  State<Data_ProductPage> createState() => _DataProductPage();
}

class _DataProductPage extends State<Data_ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'ข้อมูลจัดส่ง'),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 400, // กำหนดความยาวของเส้น
                  child: const Divider(
                    color: Color.fromARGB(255, 100, 95, 95), // สีของเส้น
                    thickness: 0.5,
                    height: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // วงกลม 4 อันเรียงกันพร้อมข้อความใต้ไอคอน
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCircleWithText('assets/icon/parcel.png', 'รอไรเดอร์รับ',
                    const Color.fromARGB(255, 12, 24, 68)), // วงกลมที่ 1
                _buildCircleWithText(
                    'assets/icon/check-mark.png',
                    'ไรเดอร์รับงานแล้ว',
                    const Color.fromARGB(255, 12, 24, 68)
                        .withOpacity(0.5)), // วงกลมที่ 2
                _buildCircleWithText(
                    'assets/icon/fast-delivery.png',
                    'กำลังดำเนินการจัดส่ง',
                    const Color.fromARGB(255, 12, 24, 68)
                        .withOpacity(0.5)), // วงกลมที่ 3
                _buildCircleWithText(
                    'assets/icon/verify.png',
                    'จัดส่งสำเร็จ',
                    const Color.fromARGB(255, 12, 24, 68)
                        .withOpacity(0.5)), // วงกลมที่ 4
              ],
            ),
            const SizedBox(height: 20),
            // ข้อความ ผู้ส่ง - ผู้รับ
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text(
                    'ผู้ส่ง - ผู้รับ',
                    style: GoogleFonts.kanit(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 162, 13, 13),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // การ์ดสำหรับแสดงข้อมูลผู้ส่งและผู้รับ
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ข้อมูลผู้ส่ง (ด้านซ้าย)
                    _buildSenderReceiverInfo(
                      imagePath: 'assets/images/cat.png',
                      name: 'ชื่อผู้ส่ง: คุณสมชาย',
                      phone: 'เบอร์โทร: 091-234-5678',
                      address: 'ที่อยู่: 123/45 ถ.สุขุมวิท เขตบางนา กทม.',
                      parcelNo: 'เลขพัสดุ: 123456789xxx',
                    ),
                    const SizedBox(width: 30),
                    // ข้อมูลผู้รับ (ด้านขวา)
                    _buildSenderReceiverInfo(
                      imagePath: 'assets/images/cat.png',
                      name: 'ชื่อผู้รับ: คุณสมหญิง',
                      phone: 'เบอร์โทร: 081-987-6543',
                      address: 'ที่อยู่: 543/21 ถ.พระราม 9 เขตห้วยขวาง กทม.',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text(
                    'ไรเดอร์',
                    style: GoogleFonts.kanit(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 12, 24, 68),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // การ์ดแสดงข้อมูลไรเดอร์
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/cat.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // ใช้ SizedBox แทน Expanded
                    SizedBox(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'kkxpter',
                            style: GoogleFonts.kanit(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 162, 13, 13),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'เบอร์ 0999999999',
                            style: GoogleFonts.kanit(
                              fontSize: 12,
                              color: const Color.fromARGB(255, 126, 122, 122),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'ทะเบียนรถ มมส 555 สารคาม',
                            style: GoogleFonts.kanit(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 126, 122, 122),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // ปุ่มต่าง ๆ
            Column(
              children: [
                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      log("ปุ่ม รายละเอียดสินค้า!");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Data_ProductPage_2()),
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
                      'รายละเอียดสินค้า',
                      style: GoogleFonts.kanit(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 12, 24, 68),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      log("mapppp");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Mapping()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 12, 24, 68),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      textStyle: GoogleFonts.kanit(
                        fontSize: 18,
                      ),
                    ),
                    child: Text(
                      'ดูตำแหน่ง',
                      style: GoogleFonts.kanit(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSenderReceiverInfo({
    required String imagePath,
    required String name,
    required String phone,
    required String address,
    String? parcelNo,
  }) {
    return Container(
      width: 160, // กำหนดขนาดที่เหมาะสมแทนการใช้ Expanded
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            style: GoogleFonts.kanit(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 33, 33, 33),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            phone,
            style: GoogleFonts.kanit(
              fontSize: 12,
              color: const Color.fromARGB(255, 80, 80, 80),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            address,
            style: GoogleFonts.kanit(
              fontSize: 12,
              color: const Color.fromARGB(255, 80, 80, 80),
            ),
          ),
          const SizedBox(height: 6),
          if (parcelNo != null)
            Text(
              parcelNo,
              style: GoogleFonts.kanit(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 50, 50, 50),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCircleWithText(
    String imagePath,
    String text,
    Color backgroundColor,
  ) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: GoogleFonts.kanit(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 12, 24, 68),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
