import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:ppkd_uqyy/tugas13/preferences/preference_handler.dart';
import 'package:ppkd_uqyy/day33/models/profile.dart';

class ApiServiceProfile {
  static const String baseUrl = "https://absensib1.mobileprojp.com/api";
  static const String endPoint = "/api/profile";

  static Future<ProfileModel> getProfile() async {
    try {
      // Ambil token dari SharedPreferences
      final token = await PreferenceHandler.getToken();

      if (token == null || token.isEmpty) {
        throw Exception("Token tidak ditemukan. Silakan login kembali.");
      }

      final url = Uri.parse('$baseUrl$endPoint');

      final response = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      log("PROFILE STATUS: ${response.statusCode}");
      log("PROFILE RAW: ${response.body}");

      // Decode JSON
      dynamic jsonResponse;
      try {
        jsonResponse = jsonDecode(response.body);
      } catch (_) {
        throw Exception("Format respon server tidak valid.");
      }

      // Jika sukses
      if (response.statusCode == 200) {
        return ProfileModel.fromJson(jsonResponse);
      }

      // Jika error dari server
      final msg = (jsonResponse is Map && jsonResponse["message"] != null)
          ? jsonResponse["message"].toString()
          : "Gagal mengambil profil";

      throw Exception(msg);

    } catch (e) {
      throw Exception("Error: ${e.toString()}");
    }
  }
}
