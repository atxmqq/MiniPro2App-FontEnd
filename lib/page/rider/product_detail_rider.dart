import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minipro2app/page/widgets/appbar.dart';

class ProductDetailRider extends StatefulWidget {
  const ProductDetailRider({super.key});

  @override
  State<ProductDetailRider> createState() => _ProductDetailRider();
}

class _ProductDetailRider extends State<ProductDetailRider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'รายละเอียดสินค้า'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/cat.png', // โหลดรูปจาก assets
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Divider(color: Colors.grey, thickness: 1, height: 20),
            const SizedBox(height: 5),

            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0), // เพิ่มการเยื้องทางซ้าย
              child: Text(
                'รายละเอียดสินค้า',
                style: GoogleFonts.kanit(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // แสดงรายละเอียดสินค้าคงที่
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0), // เพิ่มการเยื้องทางซ้าย
              child: Text(
                'แมวขี้ดื้อมากกกกกกกกกกกกกกกกกกกดดด',
                style: GoogleFonts.kanit(
                  fontSize: 14,
                  color: const Color.fromARGB(255, 129, 130, 133),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ข้อมูลผู้ส่ง
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0), // เพิ่มการเยื้องทางซ้าย
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow('ผู้ส่ง', 'Kkxpter', isSender: true),
                  _buildInfoRow('เบอร์', '0987654321', isSender: false),
                  _buildInfoRow('ที่อยู่', 'หน้ามอ หน้าป่าย มมส',
                      isSender: false),
                  _buildInfoRow('เลขพัสดุ', 'xxxxxx1234', isSender: false),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ข้อมูลผู้รับ
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0), // เพิ่มการเยื้องทางซ้าย
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow('ผู้รับ', '_Atxmqq', isSender: true),
                  _buildInfoRow('เบอร์', '099999999', isSender: false),
                  _buildInfoRow('ที่อยู่', 'ขามเรียง มมส', isSender: false),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Helper สำหรับแสดงแถวข้อมูลผู้ส่ง/ผู้รับ
  Widget _buildInfoRow(String title, String value, {bool isSender = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title:',
            style: GoogleFonts.kanit(
              fontSize: isSender ? 16 : 14, // ขนาดใหญ่สำหรับผู้ส่ง/ผู้รับ
              fontWeight: isSender ? FontWeight.bold : FontWeight.normal,
              color: const Color.fromARGB(255, 12, 24, 68),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            // ทำให้ข้อมูลเยื้องเข้ามาทางขวา
            child: Text(
              value,
              style: GoogleFonts.kanit(
                fontSize: 14,
                color: const Color.fromARGB(255, 129, 130, 133), // สีจาง
              ),
            ),
          ),
        ],
      ),
    );
  }
}
