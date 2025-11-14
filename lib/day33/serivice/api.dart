import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ppkd_uqyy/day33/models/Registrasi.dart';
import 'package:ppkd_uqyy/day33/models/login.dart';
import 'package:ppkd_uqyy/day33/models/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
// import '../models/login_model.dart';
// import '../models/register_model.dart';
// import '../models/profile_model.dart';

class ApiService {
  // Update base URL if needed
  static const String baseUrl = 'https://absensib1.mobileprojp.com';

  // Register
  static Future<RegisterModel> register(
    String name,
    String email,
    String password,
  ) async {
    final uri = Uri.parse('$baseUrl/api/register');
    final resp = await http.post(
      uri,
      body: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': password,
      },
    );

    if (resp.statusCode == 200 || resp.statusCode == 201) {
      final Map<String, dynamic> json = jsonDecode(resp.body);
      return RegisterModel.fromJson(json);
    } else {
      throw Exception('Failed to register: ${resp.statusCode} ${resp.body}');
    }
  }

  // Login
  static Future<LoginModel> login(String email, String password) async {
    final uri = Uri.parse('$baseUrl/api/login');
    final resp = await http.post(
      uri,
      body: {'email': email, 'password': password},
    );

    if (resp.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(resp.body);
      final model = LoginModel.fromJson(json);
      if (model.token != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', model.token!);
      }
      return model;
    } else {
      throw Exception('Failed to login: ${resp.statusCode} ${resp.body}');
    }
  }

  // Get profile (authenticated)
  static Future<UserModel> getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token == null) throw Exception('No token saved');

    final uri = Uri.parse('$baseUrl/api/profile');
    final resp = await http.get(
      uri,
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );

    if (resp.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(resp.body);
      final profile = ProfileModel.fromJson(json);
      if (profile.user == null) throw Exception('Profile user null');
      return profile.user!;
    } else {
      throw Exception('Failed to get profile: ${resp.statusCode} ${resp.body}');
    }
  }

  // Update profile (PUT)
  static Future<UserModel> updateProfile({
    required int id,
    String? name,
    String? email,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token == null) throw Exception('No token saved');

    final uri = Uri.parse(
      '$baseUrl/api/user/$id',
    ); // adjust endpoint if differs
    final resp = await http.put(
      uri,
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
      body: {if (name != null) 'name': name, if (email != null) 'email': email},
    );

    if (resp.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(resp.body);
      // assume response returns user in data or similar
      final userJson = json['data'] ?? json;
      return UserModel.fromJson(userJson['user'] ?? userJson);
    } else {
      throw Exception(
        'Failed to update profile: ${resp.statusCode} ${resp.body}',
      );
    }
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}
