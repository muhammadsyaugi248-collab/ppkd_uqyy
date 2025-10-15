import 'dart:ffi';

import 'package:flutter/material.dart';

class Tugas3 extends StatelessWidget {
  const Tugas3({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
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
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 8,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(listColor.length, (index) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                        ],
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Text(
                            'Container ${index + 1}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white24,
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
