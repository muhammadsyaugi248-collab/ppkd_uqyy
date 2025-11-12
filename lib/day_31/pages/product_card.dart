import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ppkd_uqyy/day_31/product/models/store_models.dart';
import 'package:ppkd_uqyy/day_31/views/product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  final Welcome product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Format harga ke Rupiah
    final priceFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: '\$ ',
      decimalDigits: 0,
    );
    final formattedPrice = priceFormat.format(product.price ?? 0);

    return GestureDetector(
      onTap: () {
        // --- NAVIGASI KE HALAMAN DETAIL PRODUK ---
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- GAMBAR PRODUK ---
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade100,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      product.image ?? '',
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                            color: Colors.grey.shade300,
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(Icons.broken_image, color: Colors.grey),
                        );
                      },
                    ),
                  ),
                ),
                // Tombol Wishlist (Opsional)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // --- DETAIL TEKS (NAMA & HARGA) ---
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 2.0, right: 2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama Produk
                Text(
                  product.title ?? 'No Title',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                // Harga Produk
                Text(
                  formattedPrice,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
