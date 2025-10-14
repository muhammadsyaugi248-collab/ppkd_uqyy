import 'package:flutter/material.dart';

class Tugas3 extends StatelessWidget {
  const Tugas3({super.key});

  @override
  Widget build(BuildContext context) {
    // Definisi Warna
    const Color primaryBlue = Color.fromARGB(255, 34, 49, 63); // Navy
    const Color lightPrimaryBlue = Color.fromARGB(
      255,
      66,
      94,
      119,
    ); // Light Navy
    const Color accentRed = Color.fromARGB(255, 192, 57, 43); // Deep Red
    const Color softPink = Color.fromARGB(255, 231, 189, 184); // Soft Pink
    const Color secondaryWhite = Color.fromARGB(
      255,
      236,
      240,
      241,
    ); // Off-white
    return Scaffold(
      appBar: AppBar(title: Text("GridView")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: softPink, width: 5.0),
              ),
              child: const CircleAvatar(
                radius: 60, // Ukuran lingkaran
                backgroundImage: AssetImage('assets/images/habibie.jpg'),
              ),
            ),
            const SizedBox(height: 30.0), // Jarak antara foto profil dan nama
            // --- Baris 1: Nama---
            Text(
              "Halo, nama saya",
              style: TextStyle(
                fontSize: 20,
                color: lightPrimaryBlue, // Warna Font
              ),
            ),
            Text(
              "Aaliyah R. 'A. Azzahra",
              style: TextStyle(
                fontSize: 30,
                color: accentRed, // Warna Font
                fontWeight: FontWeight.bold, // Tebal
                // fontFamily: customFont, // Ganti jenis font
              ),
            ),
            // --- Baris 2: Email---
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFE0E0E0), width: 1.0),
                  ),
                ),
                child: Row(
                  // Agar semua posisi di tengah
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(Icons.mark_email_read_outlined, color: primaryBlue),
                    SizedBox(width: 15),
                    Text(
                      "aaliyahazzahra02@gmail.com",
                      style: TextStyle(fontSize: 16, color: primaryBlue),
                    ),
                  ],
                ),
              ),
            ),
            // --- Baris 3: Nomor Telepon---
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                children: [
                  const Icon(Icons.phone_android, color: primaryBlue),
                  const SizedBox(width: 15),
                  const Text(
                    "0857-7906-7337",
                    style: TextStyle(fontSize: 16, color: primaryBlue),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: softPink, // Background label
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "Kontak Utama",
                      style: TextStyle(
                        fontSize: 16,
                        color: primaryBlue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            // --- Baris 4: Statistik---
            Row(
              children: [
                // Kotak Postingan
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 7.5),
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    decoration: BoxDecoration(
                      color: primaryBlue, // Warna kotak
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 5),
                      ],
                    ),
                    child: Column(
                      children: const [
                        Text(
                          "145",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: secondaryWhite,
                          ),
                        ), // Warna Font
                        Text(
                          "Postingan",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: accentRed,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Kotak Followers
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 7.5, right: 10),
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    decoration: BoxDecoration(
                      color: primaryBlue, // Warna kotak
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 5),
                      ],
                    ),
                    child: Column(
                      children: const [
                        Text(
                          "2.5K",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: secondaryWhite,
                          ),
                        ),
                        Text(
                          "Followers",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: accentRed,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    "assets/images/soekarno.jpg",
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
