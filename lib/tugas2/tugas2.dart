import 'package:flutter/material.dart';

class Tugas2 extends StatelessWidget {
  const Tugas2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Aksi saat ikon
            Scaffold.of(context).openDrawer();
          },
        ),
        title: Text("Profil Lengkap"),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 4,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage("assets/images/download.png"),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                margin: const EdgeInsets.all(4),
                // clipBehavior: Clip.antiAlias,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.verified, color: Colors.blue),
                    Text(
                      "Muhammad Syaugi ",
                      style: TextStyle(
                        fontSize: 30,
                        color: const Color.fromARGB(255, 10, 10, 10),
                      ),
                    ),
                  ],
                ),
              ),
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
                      Icon(Icons.mark_email_read_outlined, color: Colors.brown),
                      SizedBox(width: 15),
                      Text(
                        "Dewa Zeus@gmail.com",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
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
                    const Icon(Icons.phone_android, color: Colors.brown),
                    const SizedBox(width: 15),
                    const Text(
                      "0857-7906-7337",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(247, 245, 245, 1),
                        // Background label
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 12),
                        ],
                      ),
                      child: Text(
                        "Kontak Utama",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        // borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 20),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image),
                          Text(
                            "Postingan",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        // borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 20),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add),
                          Text(
                            "follow",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 240,
                width: double.infinity,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 230, 219, 189),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  "JANGAN LUPA BERNAFAS!, JANGAN MANUAL",
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                height: 40.0,
                color: Colors.black,
                alignment: Alignment.center,
                child: const Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
