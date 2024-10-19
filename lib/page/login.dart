import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:minipro2app/page/register.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // ล้างข้อมูลเมื่อหน้าจอถูกปิด
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 255, 255, 255), // พื้นหลังสีขาว
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50), // ระยะห่างด้านบน
            // รูปภาพ
            Image.asset(
              'assets/images/m.png',
              width: 250,
              height: 250,
              fit: BoxFit.contain,
            ),
            // ข้อความ "เข้าสู่ระบบ"
            Text(
              'เข้าสู่ระบบ',
              style: GoogleFonts.kanit(
                color: const Color.fromARGB(255, 12, 24, 68), // สีกรมเข้ม
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20), // ระยะห่างระหว่างข้อความกับการ์ด

            // การ์ดสำหรับฟอร์มกรอกข้อมูล
            Card(
              elevation: 5, // เพิ่มเงาให้การ์ด
              margin: const EdgeInsets.symmetric(
                  horizontal: 20), // ระยะห่างขอบการ์ด
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // มุมโค้งของการ์ด
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0), // ระยะห่างภายในการ์ด
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ข้อความ Name
                    Text(
                      'Name',
                      style: GoogleFonts.kanit(
                        color:
                            const Color.fromARGB(255, 12, 24, 68), // สีกรมเข้ม
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                        height: 10), // ระยะห่างระหว่างข้อความและช่องกรอก
                    // ช่องกรอก Name
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'เช่น kkxpter@gmail.com',
                        hintStyle: const TextStyle(
                          color: Colors.grey, // ทำให้ข้อความเป็นสีเทาจาง ๆ
                          fontSize: 16, // ขนาดตัวอักษร
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                        height: 20), // ระยะห่างระหว่าง Name และ Password
                    // ข้อความ Password
                    Text(
                      'Password',
                      style: GoogleFonts.kanit(
                        color:
                            const Color.fromARGB(255, 12, 24, 68), // สีกรมเข้ม
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                        height: 10), // ระยะห่างระหว่างข้อความและช่องกรอก
                    // ช่องกรอก Password
                    TextField(
                      controller: passwordController,
                      obscureText: true, // ซ่อนรหัสผ่าน
                      decoration: InputDecoration(
                        hintText: 'กรอก Password',
                        hintStyle: const TextStyle(
                          color: Colors.grey, // ทำให้ข้อความเป็นสีเทาจาง ๆ
                          fontSize: 16, // ขนาดตัวอักษร
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20), // ระยะห่างระหว่างการ์ดและปุ่ม

            // ปุ่ม "เข้าสู่ระบบ"
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 12, 24, 68), // พื้นหลังสีกรมเข้ม
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                shape: RoundedRectangleBorder(
                  // ปรับมุมปุ่มให้โค้งเล็กน้อย
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5, // เพิ่มเงานิดหน่อย
              ),
              onPressed: () {
                // ดึงข้อมูลจาก TextField
                final name = nameController.text;
                final password = passwordController.text;

                log('Name: $name');
                log('Password: $password');

                // คุณสามารถนำค่าที่ดึงได้ไปตรวจสอบการล็อกอินที่ backend ตรงนี้
                // เช่นส่ง request ไปยัง API เพื่อตรวจสอบชื่อผู้ใช้และรหัสผ่าน
              },
              child: Text(
                'เข้าสู่ระบบ',
                style: GoogleFonts.kanit(
                  color: Colors.white, // สีตัวอักษรเป็นสีขาว
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20), // ระยะห่างระหว่างปุ่มกับข้อความด้านล่าง

            // ข้อความ "คุณยังไม่มีบัญชี?"
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'คุณยังไม่มีบัญชี? ',
                  style: GoogleFonts.kanit(
                    color: Colors.black54, // สีเทาอ่อน
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const Register()), // นำทางไปหน้า Register
                    );
                  },
                  child: Text(
                    'สมัครสมาชิก',
                    style: GoogleFonts.kanit(
                      color: const Color.fromARGB(255, 12, 24, 68), // สีกรมเข้ม
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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
}
