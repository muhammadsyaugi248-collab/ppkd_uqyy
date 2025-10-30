import 'package:flutter/material.dart';

class Tugas9Kategori extends StatefulWidget {
  const Tugas9Kategori({super.key});
  @override
  State<Tugas9Kategori> createState() => _Tugas9KategoriState();
}

class _Tugas9KategoriState extends State<Tugas9Kategori> {
  final List<Map<String, dynamic>> namaPerabot = [
    {"name": "paracetamo;", 'icon': Icons.apple},
    {"name": "balsem", 'icon': Icons.apple},
    {"name": "fresh care", 'icon': Icons.apple},
    {"name": "minyak kayu putih", 'icon': Icons.apple},
    {"name": "koyo", 'icon': Icons.apple},
    {"name": "Alat Tulis dokter", 'icon': Icons.apple},
    {"name": "Buku & Majalah", 'icon': Icons.apple},
    {"name": "Peralatan Dapur", 'icon': Icons.apple},
    {"name": "Makanan Ringan", 'icon': Icons.apple},
    {"name": "Mainan Anak", 'icon': Icons.apple},
    {"name": "Peralatan Olahraga", 'icon': Icons.apple},
    {"name": "Produk Kesehatan", 'icon': Icons.apple},
    {"name": "Kosmetik", 'icon': Icons.apple},
    {"name": "Obat-obatan", 'icon': Icons.apple},
    {"name": "Aksesoris Mobil", 'icon': Icons.apple},
    {"name": "Perabot Rumah", 'icon': Icons.apple},
    {"name": "Sepatu & Sandal", 'icon': Icons.apple},
    {"name": "Barang Bekas", 'icon': Icons.apple},
    {"name": "Voucher & Tiket", 'icon': Icons.apple},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 83, 116, 70),
        title: Text('daftar obat', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Color(0xffE6CFA9),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListView.builder(
          itemCount: namaPerabot.length,
          itemBuilder: (BuildContext context, int index) {
            final item = namaPerabot[index];
            return ListTile(
              onTap: () {},
              leading: Icon(item["icon"]),
              title: Text(item["name"]),
            );
          },
        ),
      ),
    );
  }
}
