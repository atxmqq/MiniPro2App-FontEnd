import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:minipro2app/page/rider/drawer_rider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minipro2app/page/rider/data_order_rider.dart'; // Import หน้า DataOrderRider

class MainRider extends StatefulWidget {
  const MainRider({super.key});

  @override
  State<MainRider> createState() => _MainRiderState();
}

class _MainRiderState extends State<MainRider> {
  // ข้อมูลจำลอง (Mock Data)
  final List<Map<String, String>> orders = [
    {
      'name': 'คุณสมชาย ใจดี',
      'trackingNumber': 'ABC123456789',
      'image': 'assets/images/cat.png'
    },
    {
      'name': 'คุณวิภา สายสมร',
      'trackingNumber': 'XYZ987654321',
      'image': 'assets/images/cat.png'
    },
  ];

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
        centerTitle: true,
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/m.png'), // รูปโปรไฟล์
            ),
            onPressed: () {
              log("โปรไฟล์ถูกกด!");
            },
          ),
        ],
      ),
      drawer: const DrawerWidgetRider(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
            const SizedBox(height: 40),
            Text(
              'ออเดอร์',
              style: GoogleFonts.kanit(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 12, 24, 68),
              ),
            ),
            const SizedBox(height: 20),

            // ส่วนแสดงรายการออเดอร์
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          // รูปภาพพัสดุ
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              order['image']!,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),

                          // ข้อมูลออเดอร์
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  order['name']!,
                                  style: GoogleFonts.kanit(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'เลขพัสดุ: ${order['trackingNumber']}',
                                  style: GoogleFonts.kanit(fontSize: 16),
                                ),
                              ],
                            ),
                          ),

                          // ปุ่ม "ดู"
                          ElevatedButton(
                            onPressed: () {
                              log('ดูออเดอร์: ${order['trackingNumber']}');
                              // นำทางไปยังหน้า DataOrderRider พร้อมส่งข้อมูลออเดอร์ไปด้วย
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DataOrderRider(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 12, 24, 68),
                            ),
                            child: Text(
                              'ดู',
                              style: GoogleFonts.kanit(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
