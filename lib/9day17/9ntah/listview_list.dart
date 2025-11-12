import 'package:flutter/material.dart';

class tugas912extends StatefulWidget {
  const tugas912({super.key});

  @override
  State<tugas912> createState() => _tugas912State();
}

class _tugas912State extends State<tugas912> {
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
