import 'dart:convert';
import 'package:http/http.dart' as http;
// Import model 'Welcome' yang benar dari lokasinya
import 'package:ppkd_uqyy/day_31/product/models/store_models.dart';

// Nama fungsi diubah agar lebih deskriptif
Future<List<Welcome>> fetchProducts() async {
  final response = await http.get(
    Uri.parse("https://fakestoreapi.com/products"),
  );

  if (response.statusCode == 200) {
    // Parsing JSON
    final List<dynamic> productJson = json.decode(response.body);

    // Menggunakan Welcome.fromJson, sesuai model Anda
    return productJson.map((json) => Welcome.fromJson(json)).toList();
  } else {
    // Throw exception jika gagal
    throw Exception("Failed to load products");
  }
}
