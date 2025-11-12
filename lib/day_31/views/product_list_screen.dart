import 'package:flutter/material.dart';
import 'package:ppkd_uqyy/day_31/pages/product_card.dart';
import 'package:ppkd_uqyy/day_31/pages/service/api.dart';
import 'package:ppkd_uqyy/day_31/pages/widgets/shimmer_card.dart';
import 'package:ppkd_uqyy/day_31/product/models/store_models.dart'; // Import Shimmer

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  // --- STATE MANAGEMENT ---
  late Future<List<Welcome>> _productsFuture;
  List<Welcome> _allProducts = [];
  List<Welcome> _filteredProducts = [];
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _productsFuture = _loadProducts();
    _searchController.addListener(_onSearchChanged);
  }

  // Fungsi untuk memuat data pertama kali
  Future<List<Welcome>> _loadProducts() async {
    final products = await fetchProducts();
    _allProducts = products;
    _filteredProducts = products;
    return products;
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  // --- FUNGSI SEARCH ---
  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();

    if (_allProducts.isEmpty) return;

    setState(() {
      if (query.isEmpty) {
        _filteredProducts = _allProducts;
      } else {
        _filteredProducts = _allProducts
            .where((product) => product.title!.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  // --- FUNGSI PULL-TO-REFRESH ---
  Future<void> _refreshProducts() async {
    // Reset status search jika sedang aktif
    if (_isSearching) {
      _searchController.clear();
      setState(() {
        _isSearching = false;
      });
    }

    // Panggil API lagi
    final refreshedProducts = await fetchProducts();

    // Perbarui state
    setState(() {
      _allProducts = refreshedProducts;
      _filteredProducts = refreshedProducts;
      _productsFuture = Future.value(refreshedProducts);
    });
  }

  // --- APPBAR DINAMIS ---
  AppBar _buildAppBar(BuildContext context) {
    if (_isSearching) {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Keluar mode search
            setState(() {
              _isSearching = false;
              _searchController.clear();
            });
          },
        ),
        title: TextFormField(
          controller: _searchController,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Cari produk...',
            border: InputBorder.none,
            isDense: true,
          ),
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () {
              // Bersihkan teks
              _searchController.clear();
            },
          ),
        ],
      );
    } else {
      return AppBar(
        title: const Text(
          'MPRO fake shop',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              setState(() {
                _isSearching = true;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      );
    }
  }

  // --- BUILD METHOD UTAMA ---
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: FutureBuilder<List<Welcome>>(
        future: _productsFuture,
        builder: (context, snapshot) {
          // 1. SHIMMER LOADING EFFECT
          if (snapshot.connectionState == ConnectionState.waiting) {
            return GridView.builder(
              padding: const EdgeInsets.all(12.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                childAspectRatio: 0.65,
              ),
              itemCount: 8, // Jumlah shimmer placeholder
              itemBuilder: (context, index) {
                return const ShimmerProductCard();
              },
            );
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          // Tampilkan pesan jika hasil filter kosong
          if (_filteredProducts.isEmpty) {
            return const Center(
              child: Text(
                'Produk tidak ditemukan.',
                style: TextStyle(color: Colors.grey),
              ),
            );
          }

          // 2. GRIDVIEW DENGAN PULL-TO-REFRESH
          return _buildProductGrid(_filteredProducts);
        },
      ),
    );
  }

  Widget _buildProductGrid(List<Welcome> products) {
    return RefreshIndicator(
      onRefresh: _refreshProducts,
      color: Colors.black,
      child: GridView.builder(
        padding: const EdgeInsets.all(12.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          childAspectRatio: 0.65,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}
