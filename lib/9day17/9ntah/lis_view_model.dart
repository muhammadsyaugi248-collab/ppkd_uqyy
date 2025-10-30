import 'package:flutter/material.dart';
import 'package:ppkd_uqyy/9day17/appimage.dart';
import 'package:ppkd_uqyy/9day17/models/obat_models.dart';
import 'package:ppkd_uqyy/9day17/extension/rupiah.dart';

class Tugas9312 extends StatefulWidget {
  const Tugas9312({super.key});

  @override
  State<Tugas9312> createState() => _Tugas9312State();
}

class _Tugas9312State extends State<Tugas9312> {
  final List<ObatModel> namaObat = [
    ObatModel(
      name: "Paracetamol",
      price: 5000,

      backgroundColor: Colors.amber.withOpacity(0.5),
      image: AppImages.Paracetamol,
    ),
    ObatModel(
      name: "Fresh Care",
      price: 5000,

      backgroundColor: Colors.red.withOpacity(0.5),
      image: AppImages.Fresh_care,
    ),
    ObatModel(
      name: "Balsem",
      price: 15000,

      backgroundColor: Colors.orange.withOpacity(0.5),
      image: AppImages.Balsem,
    ),
    ObatModel(
      name: "Promag",
      price: 35000,

      backgroundColor: Colors.yellow.withOpacity(0.5),
      image: AppImages.Promag,
    ),
    ObatModel(
      name: "Koyo",
      price: 25000,
      backgroundColor: Colors.yellowAccent.withOpacity(0.5),
      image: AppImages.koyo,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Obat")),
      body: ListView.builder(
        itemCount: namaObat.length,
        itemBuilder: (BuildContext context, int index) {
          final item = namaObat[index];
          return ListTile(
            onTap: () {
              // Menampilkan SnackBar ketika item ditekan
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    "${item.name} ${item.price.toString().toRPCurrency()} aja",
                  ),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            tileColor: item.backgroundColor,
            leading: Image.asset(item.image, width: 60),
            title: Text(item.name),
            subtitle: Text(item.price.toString().toRPCurrency()),
          );
        },
      ),
    );
  }
}
