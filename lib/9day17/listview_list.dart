import 'package:flutter/material.dart';

class tugas9 extends StatefulWidget {
  const tugas9({super.key});

  @override
  State<tugas9> createState() => _tugas9State();
}

class _tugas9State extends State<tugas9> {
  final List<String> namaobat = [
    "Paracetaamol",
    "Fresh care",
    "Balsem",
    "Promag",
    "koyo",
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: namaobat.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text(namaobat[index]));
      },
    );
  }
}
