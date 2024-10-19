import 'dart:developer';
import 'dart:io'; // สำหรับการจัดการไฟล์รูปภาพ
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart'; // สำหรับการเลือกหรือถ่ายรูป
import 'package:minipro2app/page/widgets/appbar.dart';

class RegisRider extends StatefulWidget {
  const RegisRider({super.key});

  @override
  State<RegisRider> createState() => _RegisRider();
}

class _RegisRider extends State<RegisRider> {
  File? _image; // เก็บรูปภาพที่เลือก
  final picker = ImagePicker();

  // ตัวควบคุม TextField สำหรับแต่ละฟิลด์
  final TextEditingController _riderNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _licenseController = TextEditingController();

  // ฟังก์ชันเลือกหรือถ่ายรูป
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // แสดงเมนูเลือกรูป
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
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('ถ่ายรูปใหม่'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // ตรวจสอบว่ารหัสผ่านตรงกันหรือไม่
  bool _validatePasswords() {
    return _passwordController.text == _confirmPasswordController.text;
  }

  // แสดง Popup ยืนยัน
  void _showConfirmationDialog() {
    if (_validatePasswords()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 12, 24, 68),
            title: Text(
              'ยืนยันการลงทะเบียน',
              style: GoogleFonts.kanit(color: Colors.white),
            ),
            content: Text(
              'คุณต้องการลงทะเบียนใช่หรือไม่?',
              style: GoogleFonts.kanit(color: Colors.white),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  log("ลงทะเบียนสำเร็จ!");
                  Navigator.of(context).pop();
                },
                child: Text('ยืนยัน',
                    style: GoogleFonts.kanit(color: Colors.white)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('ยกเลิก',
                    style: GoogleFonts.kanit(color: Colors.white)),
              ),
            ],
          );
        },
      );
    } else {
      _showErrorDialog('รหัสผ่านและการยืนยันรหัสผ่านไม่ตรงกัน');
    }
  }

  // แสดง Popup ข้อผิดพลาด
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          title: Text('เกิดข้อผิดพลาด',
              style: GoogleFonts.kanit(color: Colors.white)),
          content: Text(message, style: GoogleFonts.kanit(color: Colors.white)),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child:
                  Text('ตกลง', style: GoogleFonts.kanit(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'ลงทะเบียน'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // รูปโปรไฟล์
            Center(
              child: GestureDetector(
                onTap: _showImageSourceDialog,
                child: _image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(75),
                        child: Image.file(
                          _image!,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.add_a_photo,
                          color: Colors.grey[700],
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 30),

            // ชื่อไรเดอร์
            _buildLabel('ชื่อไรเดอร์'),
            _buildTextField('กรอกชื่อไรเดอร์', _riderNameController),
            const SizedBox(height: 20),

            // รหัสผ่าน
            _buildLabel('รหัสผ่าน'),
            _buildTextField('กรอกรหัสผ่าน', _passwordController,
                isPassword: true),
            const SizedBox(height: 20),

            // ยืนยันรหัสผ่าน
            _buildLabel('ยืนยันรหัสผ่าน'),
            _buildTextField('กรอกยืนยันรหัสผ่าน', _confirmPasswordController,
                isPassword: true),
            const SizedBox(height: 20),

            // เบอร์โทร
            _buildLabel('เบอร์โทร'),
            _buildTextField('กรอกเบอร์โทร', _phoneController,
                inputType: TextInputType.phone),
            const SizedBox(height: 20),

            // ทะเบียนรถ
            _buildLabel('ทะเบียนรถ'),
            _buildTextField('กรอกทะเบียนรถ', _licenseController),
            const SizedBox(height: 40),

            // ปุ่มลงทะเบียน
            Center(
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: _showConfirmationDialog,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 12, 24, 68),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: Text(
                    'ลงทะเบียน',
                    style: GoogleFonts.kanit(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ฟังก์ชันสร้างข้อความ Label
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: GoogleFonts.kanit(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  // ฟังก์ชันสร้าง TextField
  Widget _buildTextField(
    String hint,
    TextEditingController controller, {
    bool isPassword = false,
    TextInputType inputType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.kanit(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
