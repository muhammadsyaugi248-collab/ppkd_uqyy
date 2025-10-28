import 'package:flutter/material.dart';
import 'package:ppkd_uqyy/9day17/tugas9_2.dart';
import 'package:ppkd_uqyy/9day17/tugas9_3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 9 Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CategoryScreen(),
    );
  }
}

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Kategori Terpilih (ID 1: Buah-buahan)
  final List<Product> selectedProducts = productData[1]!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Kategori Toko'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Tugas 1 (List)'),
            Tab(text: 'Tugas 2 (List<Map>)'),
            Tab(text: 'Tugas 3 (Model & Produk)'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // TUGAS 1: List<String> - Teks Saj
          ListView.builder(
            itemCount: categoryNames.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  categoryNames[index],
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                // Opsional: Untuk feedback visual saat diklik
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Memilih: ${categoryNames[index]}')),
                  );
                },
              );
            },
          ),
          // TUGAS 2: List<Map<String, dynamic>> - Nama & Ikon
          ListView.builder(
            itemCount: categoryMaps.length,
            itemBuilder: (context, index) {
              final item = categoryMaps[index];
              return ListTile(
                leading: Icon(item['icon'] as IconData, color: Colors.blue),
                title: Text(item['name'] as String),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Membuka kategori: ${item['name']}'),
                    ),
                  );
                },
              );
            },
          ),

          // TUGAS 3: Model - Kategori Terpilih & Daftar Produk
          // (Kategori Terpilih: Buah-buahan)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Kategori Terpilih
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Produk Kategori: ${categories[0].name} (ID: ${categories[0].id})',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              // Daftar Produk dari Kategori Terpilih
              Expanded(
                child: ListView.builder(
                  itemCount: selectedProducts.length,
                  itemBuilder: (context, index) {
                    // Memanggil ListProduct dengan data produk
                    return ListProduct(product: selectedProducts[index]);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
