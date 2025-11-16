import 'package:flutter/material.dart';
import 'package:ppkd_uqyy/day33/models/Registrasi.dart';
import 'package:ppkd_uqyy/day33/service/api.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  bool _obscure = true;
  bool _loading = false;

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);

    try {
      RegisterModel result = await ApiService.registerUser(
        name: _nameCtrl.text.trim(),
        email: _emailCtrl.text.trim(),
        password: _passwordCtrl.text.trim(),
      );

      if (result.token != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result.message ?? "Registrasi berhasil"),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.pop(context); // kembali ke login
      } else {
        throw Exception("Gagal membuat akun");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Register gagal: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }

    setState(() => _loading = false);
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFFF2F2F2),
    body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 380,
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 3, color: Colors.black),
              boxShadow: const [
                BoxShadow(color: Colors.black, offset: Offset(6, 6)),
              ],
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.arrow_back, size: 28),
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "CREATE ACCOUNT",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("FULL NAME",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                      const SizedBox(height: 6),

                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2)),
                        child: TextFormField(
                          controller: _nameCtrl,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(12)),
                          validator: (v) =>
                              v!.isEmpty ? "Nama wajib diisi" : null,
                        ),
                      ),

                      const SizedBox(height: 16),

                      const Text("EMAIL",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                      const SizedBox(height: 6),

                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2)),
                        child: TextFormField(
                          controller: _emailCtrl,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(12)),
                          validator: (v) =>
                              (!v!.contains("@")) ? "Email tidak valid" : null,
                        ),
                      ),

                      const SizedBox(height: 16),

                      const Text("PASSWORD",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                      const SizedBox(height: 6),

                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2)),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _passwordCtrl,
                                obscureText: _obscure,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(12),
                                ),
                                validator: (v) => v!.length < 6
                                    ? "Minimal 6 karakter"
                                    : null,
                              ),
                            ),
                            InkWell(
                              onTap: () =>
                                  setState(() => _obscure = !_obscure),
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                color: Colors.black,
                                child: const Text(
                                  "SHOW",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      const SizedBox(height: 26),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _loading ? null : _register,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: _loading
                              ? const CircularProgressIndicator(
                                  color: Colors.white, strokeWidth: 2)
                              : const Text(
                                  "CREATE ACCOUNT",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
}