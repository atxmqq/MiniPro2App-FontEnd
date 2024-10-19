import 'dart:developer';
import 'dart:io'; // สำหรับการจัดการไฟล์รูปภาพ
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart'; // สำหรับการเลือกหรือถ่ายรูป
import 'package:minipro2app/page/widgets/appbar.dart';

class Addproduct extends StatefulWidget {
  const Addproduct({super.key});

  @override
  State<Addproduct> createState() => _AddproductPage();
}

class _AddproductPage extends State<Addproduct> {
  File? _image; // ตัวแปรสำหรับจัดเก็บรูปที่เลือกหรือถ่าย
  final picker = ImagePicker(); // ตัวเลือกสำหรับเปิดแกลเลอรี่หรือกล้อง

  // ฟังก์ชันสำหรับเลือกรูปจากแกลเลอรี่หรือกล้อง
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile =
        await picker.pickImage(source: source); // เลือกรูปจากแหล่งที่เลือก
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // เก็บไฟล์รูป
      });
    }
  }

  // ฟังก์ชันสำหรับแสดงเมนูเลือกรูปหรือถ่ายรูป
  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('เลือกจากแกลเลอรี่'),
                onTap: () {
                  _pickImage(ImageSource.gallery); // เปิดแกลเลอรี่
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('ถ่ายรูปใหม่'),
                onTap: () {
                  _pickImage(ImageSource.camera); // เปิดกล้อง
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'เพิ่มสินค้า'),
      body: SingleChildScrollView(
        // ใช้ SingleChildScrollView เพื่อให้เลื่อนดูได้
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              color: Color.fromARGB(255, 100, 95, 95),
              thickness: 0.5,
              height: 1,
            ),
            const SizedBox(height: 20), // ปรับระยะห่างด้านล่างของเส้นให้น้อยลง

            // แสดงรูปที่เลือก หรือปุ่มให้เลือกรูป
            Center(
              child: GestureDetector(
                onTap: _showImageSourceDialog, // เปิดเมนูเมื่อแตะที่ภาพ
                child: _image != null
                    ? Image.file(
                        _image!, // แสดงรูปที่เลือกหรือถ่าย
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.add_a_photo,
                          color: Colors.grey[700],
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 20), // ระยะห่าง

            // ช่องใส่ชื่อสินค้า
            TextField(
              decoration: InputDecoration(
                labelText: 'ชื่อสินค้า',
                labelStyle: GoogleFonts.kanit(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20), // ระยะห่าง

            // ช่องใส่คำอธิบายสินค้า
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'คำอธิบายสินค้า',
                labelStyle: GoogleFonts.kanit(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20), // ระยะห่าง

            // เส้นแบ่งระหว่างคำอธิบายกับเบอร์โทรศัพท์
            const Divider(
              color: Color.fromARGB(255, 100, 95, 95), // สีของเส้น
              thickness: 1, // ความหนาของเส้น
              height: 20, // ความสูงระหว่างเส้นแบ่งกับองค์ประกอบอื่น
            ),

            // ข้อความ "ผู้รับ" สีแดง
            const SizedBox(height: 20), // ระยะห่าง
            Text(
              'ผู้รับ', // ข้อความ "ผู้รับ"
              style: GoogleFonts.kanit(
                color: Colors.red, // เปลี่ยนสีเป็นสีแดง
                fontSize: 16, // ขนาดของข้อความ
              ),
            ),
            const SizedBox(height: 8), // ระยะห่าง

            // ช่องสำหรับใส่เบอร์โทรศัพท์
            TextField(
              keyboardType:
                  TextInputType.phone, // ตั้งค่าว่าเป็นช่องใส่เบอร์โทร
              decoration: InputDecoration(
                labelText: 'เบอร์โทรศัพท์',
                labelStyle: GoogleFonts.kanit(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 140), // ระยะห่าง

            // ปุ่มเพิ่มสินค้า
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200, // กำหนดความกว้างของปุ่ม
                  height: 40, // กำหนดความสูงของปุ่ม
                  child: ElevatedButton(
                    onPressed:
                        _showConfirmationDialog, // แสดง Popup เมื่อกดปุ่ม
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(
                          255, 12, 24, 68), // กำหนดสีของปุ่ม
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15), // กำหนดความโค้งของมุมปุ่ม
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
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30), // ระยะห่างด้านล่าง
          ],
        ),
      ),
    );
  }

  // ฟังก์ชันสำหรับแสดง Popup ยืนยัน
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:
              const Color.fromARGB(255, 12, 24, 68), // กำหนดสีพื้นหลังของ Popup
          title: Text('ยืนยันการเพิ่มสินค้า',
              style:
                  GoogleFonts.kanit(color: Colors.white)), // เปลี่ยนสีข้อความ
          content: Text('คุณต้องการเพิ่มสินค้านี้ใช่ไหม?',
              style:
                  GoogleFonts.kanit(color: Colors.white)), // เปลี่ยนสีข้อความ
          actions: <Widget>[
            TextButton(
              onPressed: () {
                log("Confirmed!"); // คุณสามารถเพิ่มการจัดการที่นี่
                Navigator.of(context).pop(); // ปิด Popup
              },
              child: Text('ยืนยัน',
                  style: GoogleFonts.kanit(
                      color: Colors.white)), // เปลี่ยนสีข้อความ
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // ปิด Popup
              },
              child: Text('ยกเลิก',
                  style: GoogleFonts.kanit(
                      color: Colors.white)), // เปลี่ยนสีข้อความ
            ),
          ],
        );
      },
    );
  }
}
