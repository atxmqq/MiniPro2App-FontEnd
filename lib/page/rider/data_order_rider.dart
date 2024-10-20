import 'dart:developer';
import 'package:flutter/material.dart';
// import 'package:minipro2app/pages/map_rider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minipro2app/page/widgets/appbar.dart';
import 'package:minipro2app/page/rider/product_detail_rider.dart'; // Import หน้าใหม่

class DataOrderRider extends StatefulWidget {
  const DataOrderRider({super.key});

  @override
  State<DataOrderRider> createState() => _DataOrderRider();
}

class _DataOrderRider extends State<DataOrderRider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'รายการออเดอร์'),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 400,
                child: const Divider(
                  color: Color.fromARGB(255, 100, 95, 95),
                  thickness: 0.5,
                  height: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // การ์ดที่มี GestureDetector สำหรับคลิกได้
          GestureDetector(
            onTap: () {
              log("การ์ดถูกกด!");
              // นำทางไปหน้า ProductDetailRider พร้อมส่งข้อมูลไปด้วย
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailRider(),
                ),
              );
            },
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    // รูปภาพ
                    Image.asset(
                      'assets/images/cat.png',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 16),

                    // ข้อความ
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'แมวเป้า',
                            style: GoogleFonts.kanit(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'ขี้ดื้อมากเป้ฯตะซังคัก',
                            style: GoogleFonts.kanit(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const Spacer(),

          SizedBox(
            width: 200,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                log("ปุ่ม รับงาน!");
                // Navigator.push(
                //   context,
                //   // MaterialPageRoute(builder: (context) => const MapRider()),
                // );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 12, 24, 68),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                textStyle: GoogleFonts.kanit(fontSize: 18),
              ),
              child: Text(
                'รับงาน',
                style: GoogleFonts.kanit(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
