import 'dart:io'; // สำหรับการจัดการไฟล์รูปภาพ
import 'package:flutter/material.dart';
import 'package:minipro2app/page/widgets/appbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart'; // สำหรับการเลือกหรือถ่ายรูป

class EditProfileUser extends StatefulWidget {
  const EditProfileUser({super.key});

  @override
  _EditProfileUserState createState() => _EditProfileUserState();
}

class _EditProfileUserState extends State<EditProfileUser> {
  final TextEditingController _nameController =
      TextEditingController(text: 'John Doe'); // ชื่อ
  final TextEditingController _phoneController =
      TextEditingController(text: '012-3456789'); // เบอร์โทร
  final TextEditingController _addressController =
      TextEditingController(text: '123 Main Street, Bangkok'); // ที่อยู่
  final TextEditingController _passwordController =
      TextEditingController(); // รหัสผ่าน
  final TextEditingController _confirmPasswordController =
      TextEditingController(); // ยืนยันรหัสผ่าน
  File? _image; // ตัวแปรสำหรับเก็บรูปที่เลือก
  final ImagePicker _picker =
      ImagePicker(); // ตัวเลือกสำหรับเปิดกล้องหรือแกลเลอรี่

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'แก้ไขข้อมูล'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // ทำให้สามารถเลื่อนหน้าจอได้
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: _showImageSourceDialog, // เปิดเมนูเมื่อแตะที่รูป
                child: Center(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: _image != null
                        ? FileImage(_image!) // แสดงรูปที่เลือก
                        : const AssetImage('assets/images/cat.png')
                            as ImageProvider, // รูปเริ่มต้น
                  ),
                ),
              ),
              const SizedBox(height: 20), // ระยะห่าง

              const SizedBox(height: 20), // ระยะห่าง

              // ฟิลด์สำหรับกรอกชื่อ
              _buildTextField(
                controller: _nameController,
                label: 'ชื่อ',
              ),
              const SizedBox(height: 20), // ระยะห่าง

              // ฟิลด์สำหรับกรอกเบอร์โทร
              _buildTextField(
                controller: _phoneController,
                label: 'เบอร์โทร',
              ),
              const SizedBox(height: 20), // ระยะห่าง

              // ฟิลด์สำหรับกรอกป้ายทะเบียน
              _buildTextField(
                controller: _addressController,
                label: 'ที่อยู่',
              ),
              const SizedBox(height: 20), // ระยะห่าง

              // ฟิลด์สำหรับกรอกรหัสผ่าน
              _buildTextField(
                controller: _passwordController,
                label: 'รหัสผ่าน',
                obscureText: true,
              ),
              const SizedBox(height: 20), // ระยะห่าง

              // ฟิลด์สำหรับกรอกยืนยันรหัสผ่าน
              _buildTextField(
                controller: _confirmPasswordController,
                label: 'ยืนยันรหัสผ่าน',
                obscureText: true,
              ),
              const SizedBox(height: 20), // ระยะห่าง

              // ปุ่มสำหรับอัปเดตโปรไฟล์
              Center(
                child: ElevatedButton(
                  onPressed: _updateProfile, // เรียกใช้ฟังก์ชันอัปเดตโปรไฟล์
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 12, 24, 68),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                  ),
                  child: Text(
                    'อัปเดตโปรไฟล์',
                    style: GoogleFonts.kanit(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20), // ระยะห่าง
            ],
          ),
        ),
      ),
    );
  }

  // ฟังก์ชันสำหรับการอัปเดตโปรไฟล์
  void _updateProfile() {
    if (_passwordController.text == _confirmPasswordController.text) {
      // ถ้ารหัสผ่านและยืนยันรหัสผ่านตรงกัน
      // แสดงข้อมูลใน Console (ในที่นี้สามารถเพิ่มการจัดการการบันทึกได้)
      print('ชื่อ: ${_nameController.text}');
      print('เบอร์โทร: ${_phoneController.text}');
      print('ที่อยู่: ${_addressController.text}');
      print('รหัสผ่าน: ${_passwordController.text}');

      // แสดง Snackbar แจ้งว่าอัปเดตสำเร็จ
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'อัปเดตโปรไฟล์เรียบร้อย!',
            style: GoogleFonts.kanit(),
          ),
        ),
      );
    } else {
      // ถ้ารหัสผ่านไม่ตรงกัน
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'รหัสผ่านไม่ตรงกัน!',
            style: GoogleFonts.kanit(),
          ),
        ),
      );
    }
  }

  // ฟังก์ชันสำหรับเลือกรูปจากกล้องหรือแกลเลอรี่
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // เก็บไฟล์รูป
      });
    }
  }

  // ฟังก์ชันสำหรับแสดงเมนูเลือกรูป
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

  // ฟังก์ชันสำหรับสร้าง TextField
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText, // สำหรับฟิลด์รหัสผ่าน
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), // ทำให้มีความโค้ง
        ),
        filled: false, // ลบสีพื้นหลัง
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 12.0, vertical: 10.0), // เพิ่ม padding ภายในช่องกรอก
      ),
    );
  }
}
