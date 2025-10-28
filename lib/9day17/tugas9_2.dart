import 'package:flutter/material.dart';

class Tugas92 extends StatefulWidget {
  const Tugas92({super.key});

  @override
  State<Tugas92> createState() => _Tugas92State();
}

class _Tugas92State extends State<Tugas92> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// MODEL DATA

class Category {
  final int id;
  final String name;
  final IconData icon;
  final String description;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.description,
  });
}

class Product {
  final String name;
  final String description;
  final String imageUrl; // Placeholder for image path/url
  final double price;

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

// DATA SUMBER

// Pendekatan 1: List<String> (10 data)
const List<String> categoryNames = [
  'Buah-buahan',
  'Sayuran',
  'Elektronik',
  'Pakaian Pria',
  'Pakaian Wanita',
  'Alat Tulis Kantor',
  'Buku & Majalah',
  'Peralatan Dapur',
  'Makanan Ringan',
  'Minuman',
];

// Pendekatan 2: List<Map<String, dynamic>> (10 data)
const List<Map<String, dynamic>> categoryMaps = [
  {'name': 'Buah-buahan', 'icon': Icons.apple},
  {'name': 'Sayuran', 'icon': Icons.grass},
  {'name': 'Elektronik', 'icon': Icons.devices_other},
  {'name': 'Pakaian Pria', 'icon': Icons.man},
  {'name': 'Pakaian Wanita', 'icon': Icons.woman},
  {'name': 'Alat Tulis Kantor', 'icon': Icons.auto_stories},
  {'name': 'Buku & Majalah', 'icon': Icons.menu_book},
  {'name': 'Peralatan Dapur', 'icon': Icons.kitchen},
  {'name': 'Makanan Ringan', 'icon': Icons.fastfood},
  {'name': 'Minuman', 'icon': Icons.local_drink},
];

// Pendekatan 3: List<Category> (10 data)
final List<Category> categories = [
  Category(
    id: 1,
    name: 'Buah-buahan',
    icon: Icons.apple,
    description: 'Segala jenis buah segar, import, dan lokal.',
  ),
  Category(
    id: 2,
    name: 'Sayuran',
    icon: Icons.grass,
    description: 'Sayuran hijau, umbi-umbian, dan rempah-rempah.',
  ),
  Category(
    id: 3,
    name: 'Elektronik',
    icon: Icons.devices_other,
    description: 'Gadget, komputer, dan peralatan rumah tangga pintar.',
  ),
  Category(
    id: 4,
    name: 'Pakaian Pria',
    icon: Icons.man,
    description: 'Kemeja, kaos, celana, dan aksesoris pria.',
  ),
  Category(
    id: 5,
    name: 'Pakaian Wanita',
    icon: Icons.woman,
    description: 'Blouse, dress, rok, dan aksesoris wanita.',
  ),
  Category(
    id: 6,
    name: 'Alat Tulis Kantor',
    icon: Icons.auto_stories,
    description: 'Pulpen, kertas, buku, dan perlengkapan administrasi.',
  ),
  Category(
    id: 7,
    name: 'Buku & Majalah',
    icon: Icons.menu_book,
    description: 'Novel, buku pelajaran, dan majalah terbaru.',
  ),
  Category(
    id: 8,
    name: 'Peralatan Dapur',
    icon: Icons.kitchen,
    description: 'Panci, pisau, dan alat masak modern lainnya.',
  ),
  Category(
    id: 9,
    name: 'Makanan Ringan',
    icon: Icons.fastfood,
    description: 'Camilan, keripik, dan aneka kue kering.',
  ),
  Category(
    id: 10,
    name: 'Minuman',
    icon: Icons.local_drink,
    description: 'Air mineral, soft drink, dan jus kemasan.',
  ),
];

// Data Produk Fiktif (berdasarkan urutan nama, misal Aaliyah -> Kategori 1: Buah-buahan)
// Kategori Terpilih adalah 'Buah-buahan' (index 0 / id 1)
final Map<int, List<Product>> productData = {
  1: [
    // Buah-buahan
    Product(
      name: 'Apel Fuji Premium',
      description:
          'Apel impor dengan rasa manis dan tekstur renyah. Berat 1kg.',
      imageUrl: 'assets/apple.jpg', // Ganti dengan path gambar fiktif
      price: 35000.0,
    ),
    Product(
      name: 'Pisang Cavendish',
      description:
          'Pisang berkualitas tinggi, cocok untuk smoothie atau camilan. Per sisir.',
      imageUrl: 'assets/banana.jpg', // Ganti dengan path gambar fiktif
      price: 18000.0,
    ),
    Product(
      name: 'Jeruk Pontianak',
      description: 'Jeruk lokal dengan rasa manis menyegarkan. Berat 1kg.',
      imageUrl: 'assets/orange.jpg', // Ganti dengan path gambar fiktif
      price: 25000.0,
    ),
  ],
  // Tambahkan data produk untuk kategori lain jika diperlukan untuk pengembangan penuh
};
