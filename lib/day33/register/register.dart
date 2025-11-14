import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ppkd_uqyy/day33/serivice/api.dart';
import 'package:ppkd_uqyy/day33/serivice/auth_service.dart';

// Pastikan path ini benar

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isLoading = false;

  String? _emailErrorText;
  String? _passwordErrorText;
  String? _confirmPasswordErrorText;

  @override
  void initState() {
    super.initState();
    // Mendengarkan perubahan untuk validasi real-time
    _nameController.addListener(_validateForm);
    _emailController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
    _confirmPasswordController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // --- FUNGSI VALIDASI ---

  bool _isEmailValid(String email) {
    // Validasi sederhana: minimal ada '@' dan '.'
    return email.contains('@') && email.contains('.');
  }

  bool _isPasswordLengthValid(String password) {
    return password.length >= 8;
  }

  void _validateForm() {
    // Validasi Email
    if (_emailController.text.isNotEmpty &&
        !_isEmailValid(_emailController.text)) {
      _emailErrorText = "Format email harus mengandung '@' dan '.'";
    } else {
      _emailErrorText = null;
    }

    // Validasi Password
    if (_passwordController.text.isNotEmpty &&
        !_isPasswordLengthValid(_passwordController.text)) {
      _passwordErrorText = "Password minimal 8 karakter";
    } else {
      _passwordErrorText = null;
    }

    // Validasi Confirm Password
    if (_confirmPasswordController.text.isNotEmpty &&
        _passwordController.text != _confirmPasswordController.text) {
      _confirmPasswordErrorText = "Password tidak cocok";
    } else {
      _confirmPasswordErrorText = null;
    }

    // Update UI
    setState(() {});
  }

  bool _isFormValid() {
    return _nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty &&
        _emailErrorText == null &&
        _passwordErrorText == null &&
        _confirmPasswordErrorText == null &&
        _isEmailValid(_emailController.text) &&
        _isPasswordLengthValid(_passwordController.text) &&
        _passwordController.text == _confirmPasswordController.text;
  }

  // --- LOGIKA REGISTRASI ---
  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _register() async {
    if (!_isFormValid() || _isLoading) return;

    final name = _nameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;

    setState(() {
      _isLoading = true;
    });

    try {
      final result = await AuthAPI.registerUser(
        email: email,
        name: name,
        password: password,
      );

      _showSnackBar('Registrasi Berhasil! ${result.message}', Colors.green);

      // Kembali ke halaman Login setelah berhasil
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pop(context);
      });
    } catch (e) {
      _showSnackBar(
        'Registrasi Gagal! Error: ${e.toString().replaceAll("Exception: ", "")}',
        Colors.red,
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Colors.black;
    const Color secondaryColor = Colors.white;
    bool isButtonActive = _isFormValid() && !_isLoading;
    Color buttonColor = isButtonActive ? primaryColor : Colors.grey;

    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: primaryColor),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // ... (Judul) ...
              const SizedBox(height: 40),

              // --- Input Name ---
              const Text(
                'NAME',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 5),
              _buildTextField(_nameController, color: primaryColor),
              const SizedBox(height: 20),

              // --- Input Email ---
              const Text(
                'EMAIL',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 5),
              _buildTextField(
                _emailController,
                keyboardType: TextInputType.emailAddress,
                color: _emailErrorText != null ? Colors.red : primaryColor,
              ),
              if (_emailErrorText != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    _emailErrorText!,
                    style: const TextStyle(color: Colors.red, fontSize: 10),
                  ),
                ),
              const SizedBox(height: 20),

              // --- Input Password ---
              const Text(
                'PASSWORD (MIN 8 KARAKTER)',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 5),
              _buildPasswordTextField(
                controller: _passwordController,
                isVisible: _isPasswordVisible,
                onToggle: () =>
                    setState(() => _isPasswordVisible = !_isPasswordVisible),
                color: _passwordErrorText != null ? Colors.red : primaryColor,
              ),
              if (_passwordErrorText != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    _passwordErrorText!,
                    style: const TextStyle(color: Colors.red, fontSize: 10),
                  ),
                ),
              const SizedBox(height: 20),

              // --- Input Confirm Password ---
              const Text(
                'CONFIRM PASSWORD',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 5),
              _buildPasswordTextField(
                controller: _confirmPasswordController,
                isVisible: _isConfirmPasswordVisible,
                onToggle: () => setState(
                  () => _isConfirmPasswordVisible = !_isConfirmPasswordVisible,
                ),
                color: _confirmPasswordErrorText != null
                    ? Colors.red
                    : primaryColor,
              ),
              if (_confirmPasswordErrorText != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    _confirmPasswordErrorText!,
                    style: const TextStyle(color: Colors.red, fontSize: 10),
                  ),
                ),
              const SizedBox(height: 30),

              // --- Tombol SIGN UP ---
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: isButtonActive ? _register : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor, // Warna dinamis
                    foregroundColor: secondaryColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    elevation: 0,
                    disabledBackgroundColor:
                        Colors.grey.shade400, // Warna abu-abu saat disabled
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: secondaryColor,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          'SIGN UP',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 40),

              // ... (Login Link) ...
            ],
          ),
        ),
      ),
    );
  }

  // Widget Pembantu untuk tombol SHOW/HIDE yang konsisten
  Widget _buildPasswordToggle({
    required bool isVisible,
    required VoidCallback onTap,
    required Color color,
  }) {
    const Color secondaryColor = Colors.white;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        color: color,
        alignment: Alignment.center,
        child: Text(
          isVisible ? 'HIDE' : 'SHOW',
          style: const TextStyle(
            color: secondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Widget Pembantu untuk TextField Password
  Widget _buildPasswordTextField({
    required TextEditingController controller,
    required bool isVisible,
    required VoidCallback onToggle,
    required Color color,
  }) {
    return TextField(
      controller: controller,
      obscureText: !isVisible,
      decoration: _inputDecoration(
        suffixWidget: _buildPasswordToggle(
          isVisible: isVisible,
          onTap: onToggle,
          color: color,
        ),
        borderColor: color,
      ),
    );
  }

  // Fungsi pembantu untuk dekorasi TextField yang konsisten
  InputDecoration _inputDecoration({
    Widget? suffixWidget,
    required Color borderColor,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(color: borderColor, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(color: borderColor, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(color: borderColor, width: 2.0),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      suffixIcon: suffixWidget != null
          ? SizedBox(width: 70, child: suffixWidget)
          : null,
      suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
    );
  }

  // Widget Pembantu untuk TextField biasa
  Widget _buildTextField(
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
    required Color color,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: _inputDecoration(borderColor: color),
    );
  }
}
