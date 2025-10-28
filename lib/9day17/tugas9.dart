import 'package:flutter/material.dart';

class tugas9 extends StatefulWidget {
  const tugas9({super.key});

  @override
  State<tugas9> createState() => _tugas9State();
}

class _tugas9State extends State<tugas9> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "E-Sehat",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                foreground: Paint()
                  ..shader = LinearGradient(
                    colors: <Color>[
                      const Color.fromARGB(255, 0, 139, 253),
                      const Color.fromARGB(255, 248, 246, 121),
                      const Color.fromARGB(255, 67, 116, 69),
                    ],
                    begin: Alignment.topLeft,
                    end: AlignmentGeometry.bottomRight,
                  ).createShader(Rect.fromLTWH(0, 40, 380, 100)),
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.local_hospital, color: Colors.redAccent),
          ],
        ),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      body: Column(),
    );
  }
}
