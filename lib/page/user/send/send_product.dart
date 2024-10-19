import 'dart:developer';
import 'dart:io'; // สำหรับการจัดการไฟล์รูปภาพ
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart'; // สำหรับการเลือกหรือถ่ายรูป
import 'package:minipro2app/page/widgets/appbar.dart';

class SendProduct extends StatefulWidget {
  const SendProduct({super.key});

  @override
  State<SendProduct> createState() => _SendProductPage();
}

class _SendProductPage extends State<SendProduct> {
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
    return GestureDetector(
      // เพิ่ม GestureDetector ที่นี่
      onTap: () {
        FocusScope.of(context).unfocus(); // ปิดคีย์บอร์ดเมื่อคลิกนอก TextField
      },
      child: Scaffold(
        appBar: CustomAppBar(title: 'สินค้าที่จัดส่ง'),
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
              Center(
                child: GestureDetector(
                  onTap: _showImageSourceDialog,
                  child: _image != null
                      ? Image.file(
                          _image!,
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
                          child: const Icon(
                            Icons.add_a_photo,
                            color: Color.fromARGB(255, 129, 130, 133),
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(
                color: Color.fromARGB(255, 100, 95, 95),
                thickness: 1,
                height: 20,
              ),
              const SizedBox(height: 5),
              Text(
                'รายละเอียดสินค้า',
                style: GoogleFonts.kanit(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: 'รายละเอียดสินค้า',
                  labelStyle: GoogleFonts.kanit(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'ผู้ส่ง :',
                    style: GoogleFonts.kanit(
                      color: const Color.fromARGB(255, 12, 24, 68),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Kkxpter',
                    style: GoogleFonts.kanit(
                      color: const Color.fromARGB(255, 12, 24, 68),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // แสดงเบอร์โทรศัพท์ผู้ส่ง
              Row(
                children: [
                  const SizedBox(width: 20),
                  Text(
                    'เบอร์ :',
                    style: GoogleFonts.kanit(
                      color: Color.fromARGB(255, 129, 130, 133),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '0987654321',
                    style: GoogleFonts.kanit(
                      color: Color.fromARGB(255, 129, 130, 133),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // ที่อยู่ผู้ส่ง
              Row(
                children: [
                  const SizedBox(width: 20),
                  Text(
                    'ที่อยู่ :',
                    style: GoogleFonts.kanit(
                      color: Color.fromARGB(255, 129, 130, 133),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'หน้ามอ หน้าป่าย มมส',
                    style: GoogleFonts.kanit(
                      color: Color.fromARGB(255, 129, 130, 133),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 20),
                  Text(
                    'เลขพัสดุ :',
                    style: GoogleFonts.kanit(
                      color: Color.fromARGB(255, 129, 130, 133),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'xxxxxx1234',
                    style: GoogleFonts.kanit(
                      color: Color.fromARGB(255, 129, 130, 133),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'ผู้รับ :',
                    style: GoogleFonts.kanit(
                      color: const Color.fromARGB(255, 12, 24, 68),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '_Atxmqq',
                    style: GoogleFonts.kanit(
                      color: const Color.fromARGB(255, 12, 24, 68),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // แสดงเบอร์โทรศัพท์ผู้ส่ง
              Row(
                children: [
                  const SizedBox(width: 20),
                  Text(
                    'เบอร์ :',
                    style: GoogleFonts.kanit(
                      color: Color.fromARGB(255, 129, 130, 133),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '099999999',
                    style: GoogleFonts.kanit(
                      color: Color.fromARGB(255, 129, 130, 133),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // ที่อยู่ผู้ส่ง
              Row(
                children: [
                  const SizedBox(width: 20),
                  Text(
                    'ที่อยู่ :',
                    style: GoogleFonts.kanit(
                      color: Color.fromARGB(255, 129, 130, 133),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'ขามเรียง มมส',
                    style: GoogleFonts.kanit(
                      color: Color.fromARGB(255, 129, 130, 133),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 20),
                  Text(
                    'เลขพัสดุ :',
                    style: GoogleFonts.kanit(
                      color: Color.fromARGB(255, 129, 130, 133),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'xxxxxx1234',
                    style: GoogleFonts.kanit(
                      color: Color.fromARGB(255, 129, 130, 133),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // ปุ่มดำเนินการต่ออยู่ด้านล่าง
              Center(
                child: SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: _showConfirmationDialog,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 12, 24, 68),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      textStyle: GoogleFonts.kanit(
                        fontSize: 18,
                      ),
                    ),
                    child: Text(
                      'ดำเนินต่อ',
                      style: GoogleFonts.kanit(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30), // ระยะห่างด้านล่าง
            ],
          ),
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
          backgroundColor: const Color.fromARGB(255, 12, 24, 68),
          title: Text('ต้องการส่งสินค้าเลยหรือไม่',
              style: GoogleFonts.kanit(color: Colors.white)),
          content:
              Text('ส่งเลยเดะ?', style: GoogleFonts.kanit(color: Colors.white)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                log("Confirmed!");
                Navigator.of(context).pop();
              },
              child:
                  Text('ยืนยัน', style: GoogleFonts.kanit(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:
                  Text('ยกเลิก', style: GoogleFonts.kanit(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
