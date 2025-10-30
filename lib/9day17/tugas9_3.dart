import 'package:flutter/material.dart';
import 'package:ppkd_uqyy/9day17/appimage.dart';
import 'package:ppkd_uqyy/9day17/extension/rupiah.dart';
import 'package:ppkd_uqyy/9day17/models/obat_models.dart';

// NOMOR 3
class Tugas9 extends StatefulWidget {
  const Tugas9({super.key});
  @override
  State<Tugas9> createState() => _Tugas9State();
}

class _Tugas9State extends State<Tugas9> {
  final List<ObatModel> namaObat = [
    ObatModel(name: "paracetamol", price: 7000, image: AppImages.Paracetamol),
    ObatModel(name: "Baskom", price: 7000, image: AppImages.Balsem),
    ObatModel(name: "fresh care", price: 10000, image: AppImages.Fresh_care),
    ObatModel(name: "balsem", price: 15000000, image: AppImages.Balsem),
    ObatModel(name: "promag", price: 8000, image: AppImages.Promag),
    ObatModel(name: "koyo", price: 60000, image: AppImages.koyo),
    ObatModel(name: "paracetamol", price: 100000, image: AppImages.Paracetamol),
    ObatModel(name: "koyo", price: 25000, image: AppImages.koyo),
    ObatModel(name: "betadine", price: 30000, image: AppImages.betadine),
    ObatModel(name: "fresh care", price: 15000, image: AppImages.Fresh_care),
    ObatModel(name: "paraceatmol", price: 20000, image: AppImages.Promag),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 51, 70, 52),
        title: Text('daftar obat', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Color(0xffE6CFA9),
      body: ListView.builder(
        itemCount: namaObat.length,
        itemBuilder: (BuildContext context, int index) {
          final item = namaObat[index];
          return ListTile(
            onTap: () {},
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
