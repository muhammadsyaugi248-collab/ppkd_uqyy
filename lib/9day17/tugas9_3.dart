import 'package:flutter/material.dart';
import 'package:ppkd_uqyy/9day17/tugas9_2.dart';
// Hapus import yang tidak diperlukan atau yang berasal dari path spesifik:
// import 'package:ppkd_uqyy/9day17/tugas9_2.dart';
// Asumsi Class Product di category_model.dart memiliki properti:
// final String name;
// final String description;
// final double price;
// final String? imageUrl; // Opsional jika digunakan untuk placeholder

class ListProduct extends StatelessWidget {
  // KESALAHAN 1: Tipe argumen 'product' harusnya adalah Product, BUKAN ListProduct.
  final Product product;

  const ListProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Menggunakan Card untuk tampilan yang lebih menarik
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Kolom Kiri: Gambar (Placeholder)
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                // KESALAHAN 2: Colors.grey[200] mungkin null, pastikan ini aman.
                // Disarankan menggunakan null safety yang ketat.
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.shopping_bag,
                size: 40,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(width: 10),
            // Kolom Tengah: Nama & Deskripsi
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    // KESALAHAN 3: Koma (,) hilang setelah product.name
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    product.description,
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // Kolom Kanan: Harga
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  // Menampilkan harga dengan format Rp dan 0 desimal
                  'Rp ${product.price.toStringAsFixed(0)}',
                  style: const TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 5),
                const Icon(Icons.add_shopping_cart, color: Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
