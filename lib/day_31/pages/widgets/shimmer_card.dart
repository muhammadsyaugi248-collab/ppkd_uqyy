import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProductCard extends StatelessWidget {
  const ShimmerProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Menggunakan layout yang sama persis dengan ProductCard
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder Gambar
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          // Placeholder Teks (Nama Produk)
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 2.0, right: 2.0),
            child: Container(
              height: 14,
              width: double.infinity,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          // Placeholder Teks (Harga)
          Padding(
            padding: const EdgeInsets.only(left: 2.0, right: 2.0),
            child: Container(
              height: 16,
              width: 80, // Ukuran lebih pendek untuk harga
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
