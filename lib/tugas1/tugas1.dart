import 'package:flutter/material.dart';

class Tugas1 extends StatelessWidget {
  const Tugas1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text('Profil Saya'),
        titleTextStyle: TextStyle(color: const Color.fromARGB(255, 40, 255, 76), fontSize: 25, fontWeight: FontWeight.w900) , 
        backgroundColor: const Color.fromARGB(255, 0, 0, 0)
        ,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          Text(
            'Nama : Muhammad Syaugi',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: Color.fromARGB(255, 0, 255, 64)),
              Text(
                'Jakarta Pusat',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 19,
                ),
              ),
            ],
          ),
          Text(
            '"Tetaplah bernapas"',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 18,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}