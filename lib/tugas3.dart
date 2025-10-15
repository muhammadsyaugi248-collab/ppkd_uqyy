import 'dart:ffi';

import 'package:flutter/material.dart';

class Tugas3 extends StatelessWidget {
  const Tugas3({super.key});

  @override
  Widget build(BuildContext context) {
    {
      final List listColor = [
        Color(0xFF5D688A),
        Color(0xFFF7A5A5),
        Color(0xFFFFDBB6),
        Color(0xFFFFF2EF),
        Color(0xFF896C6C),
        Color(0xFFE5BEB5),
      ];

      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.white,),
            onPressed: () {
              // Aksi saat ikon
              Scaffold.of(context).openDrawer();
            },
          ),
          title: Text("Text Field"),
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          backgroundColor: Colors.brown,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nama"),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Masukkan Nama Anda",
                ),
              ),
              Text("E-mail"),

              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "i'munderwater123@gmail.combro",
                ),
              ),
              Text("No. Hp"),

              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "62+ ..",
                ),
              ),
              Text("Deskripsikan Tentang Anda"),

              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "....",
                ),
            ],
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(height: 300, width: 300, color: Color(0xFF556B2F)),
              Container(height: 200, width: 200, color: Color(0xFF8FA31E)),
              Positioned(
                bottom: -20,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Color(0xFFC6D870),
                ),
              ),
            ],
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(height: 300, width: 300, color: Color(0xFF556B2F)),
              Container(height: 200, width: 200, color: Color(0xFF8FA31E)),
              Positioned(
                bottom: -20,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Color(0xFFC6D870),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
