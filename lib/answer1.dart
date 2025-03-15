import 'package:flutter/material.dart';

class Accountpage extends StatefulWidget {
  const Accountpage({super.key});

  @override
  State<Accountpage> createState() => _AccountpageState();
}

class _AccountpageState extends State<Accountpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("โปรไฟล์ผู้ใช้"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  "https://www.kasandbox.org/programming-images/avatars/leaf-blue.png"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "ชื่อผู้ใช้: John Doe",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("อีเมล:johndoe@example.com",
                style: TextStyle(color: Colors.grey)),
            SizedBox(
              height: 30,
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.blue),
              title: Text("การตั้งค่า"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.lock, color: Colors.blue),
              title: Text("เปลี่ยนรหัสผ่าน"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip_rounded, color: Colors.blue),
              title: Text("ความเป็นส่วนตัว"),
              onTap: () {},
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("แก้ไขโปรไฟล์")));
                },
                child: Text("แก้ไขโปรไฟล์")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("ออกจากระบบ")));
                },
                child: Text("ออกจากระบบ"))
          ],
        ),
      ),
    );
  }
}
