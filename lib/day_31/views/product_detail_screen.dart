import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:ppkd_uqyy/day_31/product/models/store_models.dart';

class ProductDetailScreen extends StatelessWidget {
  final Welcome product;

  // Menerima objek produk yang dipilih dari halaman sebelumnya
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Format harga ke Rupiah
    final priceFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: '\$ ',
      decimalDigits: 0,
    );
    final formattedPrice = priceFormat.format(product.price ?? 0);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          product.title ?? 'Detail Produk',
          style: const TextStyle(color: Colors.black, fontSize: 16),
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- GAMBAR PRODUK ---
            Center(
              child: Container(
                constraints: const BoxConstraints(maxHeight: 300),
                padding: const EdgeInsets.all(16.0),
                child: Image.network(product.image ?? '', fit: BoxFit.contain),
              ),
            ),
            const SizedBox(height: 20),

            // --- NAMA PRODUK & HARGA ---
            Text(
              product.title ?? 'Tidak Ada Nama',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              formattedPrice,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900, // Sangat Tebal agar menonjol
                color: Colors.red, // Harga bisa diberi warna berbeda
              ),
            ),
            const SizedBox(height: 16),

            // --- KATEGORI & RATING (Fitur Tambahan Keren) ---
            Row(
              children: [
                const Icon(Icons.category, size: 18, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  product.category ?? 'Tidak Ada Kategori',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const Spacer(),
                const Icon(Icons.star, size: 18, color: Colors.amber),
                const SizedBox(width: 4),
                Text(
                  '${product.rating?.rate ?? 0} (${product.rating?.count ?? 0})',
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
            const Divider(height: 32),

            // --- DESKRIPSI PRODUK (YANG ANDA MINTA) ---
            const Text(
              'Deskripsi Produk',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              product.description ?? 'Deskripsi produk tidak tersedia.',
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black87,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
      // --- Tombol Aksi ---
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            // Aksi Tambah ke Keranjang/Beli Sekarang
          },
          child: const Text(
            'TAMBAH KE KERANJANG',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
