import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minipro2app/config/config.dart';
import 'package:minipro2app/models/login_user_request.dart';
import 'package:minipro2app/page/register.dart';
import 'package:minipro2app/page/startlogin.dart'; // หน้า Register ของคุณ

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController phoneNoCt1 = TextEditingController();
  TextEditingController passwordNoCt1 = TextEditingController();
  GetStorage gs = GetStorage();

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
            Image.asset(
              'assets/images/m.png', // ใส่ภาพที่ต้องการ
              width: 250,
              height: 250,
              fit: BoxFit.contain,
            ),
            Text(
              'เข้าสู่ระบบ',
              style: GoogleFonts.kanit(
                color: const Color.fromARGB(255, 12, 24, 68), // สีกรมเข้ม
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20), // ระยะห่างระหว่างข้อความกับการ์ด
            Card(
              elevation: 5, // เพิ่มเงาให้การ์ด
              margin: const EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // มุมโค้งของการ์ด
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phone',
                      style: GoogleFonts.kanit(
                        color:
                            const Color.fromARGB(255, 12, 24, 68), // สีกรมเข้ม
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: phoneNoCt1,
                      onChanged: (value) {
                        log('Phone number: $value'); // Log เมื่อมีการพิมพ์ในฟิลด์โทรศัพท์
                      },
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Password',
                      style: GoogleFonts.kanit(
                        color:
                            const Color.fromARGB(255, 12, 24, 68), // สีกรมเข้ม
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: passwordNoCt1,
                      obscureText: true,
                      onChanged: (value) {
                        log('Password: $value'); // Log เมื่อมีการพิมพ์ในฟิลด์รหัสผ่าน
                      },
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
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
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 12, 24, 68),
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
              ),
              onPressed: loginuser,
              child: Text(
                'เข้าสู่ระบบ',
                style: GoogleFonts.kanit(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'คุณยังไม่มีบัญชี? ',
                  style: GoogleFonts.kanit(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Register()),
                    );
                  },
                  child: Text(
                    'สมัครสมาชิก',
                    style: GoogleFonts.kanit(
                      color: const Color.fromARGB(255, 12, 24, 68),
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

  void loginuser() async {
    LoginUserRequest model = LoginUserRequest(
      phone: phoneNoCt1.text,
      password: passwordNoCt1.text,
    );

    // เช็คว่ามีการกรอกข้อมูลหรือไม่
    if (model.phone.trim().isEmpty || model.password.trim().isEmpty) {
      // แสดงป็อบอัพเตือนเมื่อไม่มีการกรอกข้อมูล
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
                child: Text(
              'กรุณากรอกเบอร์โทรศัพท์และรหัสผ่าน',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            )),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    child: Text('ตกลง'),
                    style: FilledButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 72, 0, 0),
                        foregroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        textStyle: TextStyle(fontSize: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 5),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          );
        },
      );
      return; // ออกจากฟังก์ชันถ้าไม่มีข้อมูล
    }

    var config = await Configuration.getConfig();
    var url = config['apiEndpoint'];

    try {
      final response = await http.post(
        Uri.parse("$url/user/login"),
        headers: {"Content-Type": "application/json; charset=utf-8"},
        body: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        // การล็อกอินสำเร็จ
        var responseData = jsonDecode(response.body); // เปลี่ยนตรงนี้
        if (responseData['message'] == 'Login successful') {
          gs.write(
              'uid',
              responseData['user']
                  ['uid']); //ถ้าlogin ผ่านให้เก็บ username ไว้ในระบบ
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StartLogin(),
            ),
          );
          log('Login True');
        }
      } else if (response.statusCode == 400) {
        // ข้อมูลไม่ครบถ้วน
        var errorData = jsonDecode(response.body);
        log('Error: ${errorData['error']}');
      } else if (response.statusCode == 404) {
        // ไม่พบผู้ใช้
        var errorData = jsonDecode(response.body);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Center(
                  child: Text(
                'ไม่พบผู้ใช้',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(
                      child: Text('ตกลง'),
                      style: FilledButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 72, 0, 0),
                          foregroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          textStyle: TextStyle(fontSize: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          elevation: 5),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        );
        log('Error: ${errorData['error']}');
      } else if (response.statusCode == 401) {
        // รหัสผ่านไม่ถูกต้อง
        var errorData = jsonDecode(response.body);
        // แสดงป็อบอัพเตือนเมื่อรหัสผ่านไม่ถูกต้อง
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Center(
                  child: Text(
                'รหัสผ่านไม่ถูกต้อง',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(
                      child: Text('ตกลง'),
                      style: FilledButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 72, 0, 0),
                          foregroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          textStyle: TextStyle(fontSize: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          elevation: 5),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        );
        log('Error: ${errorData['error']}');
      } else {
        // ข้อผิดพลาดอื่น ๆ
        log('Unexpected error: ${response.statusCode}');
      }
    } catch (e) {
      log('Error: $e');
    }
  }
}
