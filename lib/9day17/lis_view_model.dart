import 'package:flutter/material.dart';
import 'package:ppkd_uqyy/9day17/appimage.dart';
import 'package:ppkd_uqyy/9day17/models/oabat_models.dart';
import 'package:ppkd_uqyy/extension/rupiah.dart';

class Tugas9 extends StatefulWidget {
  const Tugas9({super.key});

  @override
  State<Tugas9> createState() => _Tugas9State();
}

class _Tugas9State extends State<Tugas9> {
  final List<ObatModel> namaObat = [
    ObatModel(
      name: "Paracetamol",
      price: 5000,
      condition: "Segar",
      backgroundColor: Colors.amber.withOpacity(0.5),
      image: AppImages.Paracetamol,
    ),
    ObatModel(
      name: "Fresh Care",
      price: 5000,
      condition: "Segar",
      backgroundColor: Colors.red.withOpacity(0.5),
      image: AppImages.Fresh_care,
    ),
    ObatModel(
      name: "Balsem",
      price: 15000,
      condition: "Segar",
      backgroundColor: Colors.orange.withOpacity(0.5),
      image: AppImages.Balsem,
    ),
    ObatModel(
      name: "Promag",
      price: 35000,
      condition: "Segar",
      backgroundColor: Colors.yellow.withOpacity(0.5),
      image: AppImages.Promag,
    ),
    ObatModel(
      name: "Koyo",
      price: 2000,
      condition: "Segar",
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
