import 'package:flutter/material.dart';
import 'package:ppkd_uqyy/10day18/tugas10.dart';
import 'package:ppkd_uqyy/tugas4/tugas4.dart';

class Tugas6 extends StatefulWidget {
  const Tugas6({super.key});

  @override
  State<Tugas6> createState() => _Tugas6State();
}

class _Tugas6State extends State<Tugas6> {
  bool showtext = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // ilang bayangan di bawah AppBar
        elevation: 0,
        backgroundColor: Colors.white,

        // Flutter otomatis menambahkan tombol kembali jika ada halaman sebelumnya.
        // Jika Anda ingin kustom, gunakan leading:
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            // Aksi kembali ke halaman sebelumnya
            Navigator.pop(context);
          },
        ),

        // Teks Judul App Bar ("Login")
        title: const Text(
          'Login',
          style: TextStyle(
            color: Colors.black, // Warna teks hitam
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 4), // Jarak dari App Bar
            // Teks "Welcome Back"
            const Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 20),

            // Teks "Sign In to your account"
            const Text(
              'Sign In to your account',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 30),

            // -   -- Area Form Login ---

            // Input Email Address
            const Text('Email Address', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            _buildTextField(
              'helloteja@gmail.com',
              false,
            ), // Widget kustom untuk input

            const SizedBox(height: 20),

            // Input Password
            const Text('Password', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            _buildTextField('.........', true), // Widget kustom untuk input

            const SizedBox(height: 2),

            // Tombol Forgot Password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  //logikanya
                },
                child: const Text(
                  'Forgot Pasword?',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
            SizedBox(height: 24),
            // Tombol Login
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Tugas4()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700, // Warna biru gelap
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 8),
            // "Don't have an account? Sign Up"
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //  "Don't have an account?"
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),

                // Tombol teks "Sign Up" yang bisa diklik
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Tugas10()),
                    );
                  },
                  style: TextButton.styleFrom(
                    // Menghapus padding/jarak bawaan TextButton agar terlihat lebih rapi
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Color(0xFFE57373),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            //"or sign in with"
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Color.fromARGB(255, 209, 209, 209),
                    endIndent: 16,
                    height: 9,
                  ),
                ),
                Text(
                  'Or sign in with',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    indent: 16,
                    color: Colors.grey,
                    height: 9,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 100,
                // width: 100,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomLoginButton(
                      label: 'Google',
                      imagePath: 'assets/images/gogl.jpg',
                    ),
                    SizedBox(width: 12),
                    CustomLoginButton(
                      label: ' Facebook',
                      imagePath: 'assets/images/fb.jpg',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),

            // "Don't have an account? Sign Up"
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // Teks biasa "Don't have an account?"
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),

                // Tombol teks "Sign Up" yang bisa diklik
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Tugas10()),
                    );
                  },
                  style: TextButton.styleFrom(
                    // Menghapus padding/jarak bawaan TextButton agar biar rapi
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'Join Us',
                    style: TextStyle(
                      color: Color(0xFFE57373),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//menyembunyikan password
Widget _buildTextField(String hintText, bool isPassword) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(25),
    ),
    child: TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        // ilanginborder default TextField
        border: InputBorder.none,
        suffixIcon: isPassword
            ? IconButton(
                icon: const Icon(
                  Icons.remove_red_eye_outlined,
                  color: Colors.grey,
                ),
                onPressed: () {
                  isPassword = !isPassword;
                },
              )
            : null,
      ),
    ),
  );
}

class CustomLoginButton extends StatelessWidget {
  final String imagePath;
  final String label;

  const CustomLoginButton({
    super.key,
    required this.imagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.black,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.white),
          color: Colors.grey.shade100,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              spacing: 6,
              children: [
                Image.asset(imagePath, height: 18, width: 18),
                Text(
                  label,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
