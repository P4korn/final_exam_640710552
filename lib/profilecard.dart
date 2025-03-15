import 'package:flutter/material.dart';

class Profilecard extends StatelessWidget {
  const Profilecard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF28283C),
      body: Center(
        child: Row(
          children: [
            Container(
              height: 100,
              color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}
