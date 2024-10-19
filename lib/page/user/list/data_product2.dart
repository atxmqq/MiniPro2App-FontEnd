import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:minipro2app/page/user/list/map.dart';
import 'package:minipro2app/page/user/send/send.dart';
import 'package:minipro2app/page/widgets/appbar.dart';
import 'package:google_fonts/google_fonts.dart';

class Data_ProductPage_2 extends StatefulWidget {
  const Data_ProductPage_2({super.key});

  @override
  State<Data_ProductPage_2> createState() => _DataProductPage_2();
}

class _DataProductPage_2 extends State<Data_ProductPage_2> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // เพิ่ม GestureDetector ที่นี่
      onTap: () {
        FocusScope.of(context).unfocus(); // ปิดคีย์บอร์ดเมื่อคลิกนอก TextField
      },
      child: Scaffold(
        appBar: CustomAppBar(title: 'ข้อมูลสินค้า2'),
        body: SingleChildScrollView(
          // ใช้ SingleChildScrollView เพื่อให้สามารถเลื่อนดูเนื้อหาได้
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(
                color: Color.fromARGB(255, 100, 95, 95),
                thickness: 0.5,
                height: 1,
              ),
              const SizedBox(height: 20),

              // แสดงสถานะ
              Row(
                children: [
                  Text(
                    'สถานะ :',
                    style: GoogleFonts.kanit(
                      color: const Color.fromARGB(255, 162, 13, 13),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'รอไรเดอร์รับงาน',
                    style: GoogleFonts.kanit(
                      color: const Color.fromARGB(255, 162, 13, 13),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(
                color: Color.fromARGB(255, 100, 95, 95),
                thickness: 1,
                height: 20,
              ),

              const SizedBox(height: 30), // ระยะห่างด้านล่าง
            ],
          ),
        ),
      ),
    );
  }
}
