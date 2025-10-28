import 'package:flutter/material.dart';
// import 'package:ppkd_uqyy/tugas4.dart'; // Asumsikan file ini ada

// Ganti class Tugas4 dengan StatelessWidget kosong untuk demo
class Tugas4 extends StatelessWidget {
  const Tugas4({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Tugas 4')),
      body: const Center(child: Text('Login Berhasil!')),
    );
  }
}

void main() {
  runApp(const tugas7());
}

// =========================================================================
// WIDGET UTAMA (LEVEL APLIKASI)
// Mengandung State untuk Tema (Mode Gelap) agar dapat mengubah seluruh aplikasi.
// =========================================================================

class tugas7 extends StatefulWidget {
  const tugas7({super.key});

  @override
  State<tugas7> createState() => _tugas7State();
}

class _tugas7State extends State<tugas7> {
  // State global untuk Mode Gelap (Dark Mode)
  bool _isDarkMode = false;

  // Callback untuk mengubah state Mode Gelap
  void toggleTheme(bool isDark) {
    setState(() {
      _isDarkMode = isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = _isDarkMode ? ThemeMode.dark : ThemeMode.light;

    return MaterialApp(
      title: 'Tugas 7 Input Flutter',
      themeMode: themeMode,
      // Tema Terang
      theme: ThemeData.light(useMaterial3: true).copyWith(
        primaryColor: Colors.blueAccent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      // Tema Gelap
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        primaryColor: Colors.blue.shade800,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue.shade800,
          foregroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.grey.shade900,
        // Penting untuk memastikan teks di Dark Mode terlihat
        textTheme: Typography.whiteMountainView.copyWith(
          bodyMedium: const TextStyle(color: Colors.white70),
          bodyLarge: const TextStyle(color: Colors.white),
        ),
      ),
      // Meneruskan fungsi toggleTheme ke FormInputInteractive
      home: FormInputInteractive(
        isDarkMode: _isDarkMode,
        onToggleTheme: toggleTheme,
      ),
    );
  }
}

// WIDGET ISI ( INTERAKTIF)
// Mengandung State untuk semua input lainnya (Checkbox, Dropdown, Date, Time).

class FormInputInteractive extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool) onToggleTheme;

  const FormInputInteractive({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  State<FormInputInteractive> createState() => _FormInputInteractiveState();
}

class _FormInputInteractiveState extends State<FormInputInteractive> {
  String _currentMenu = 'Syarat & Ketentuan';
  bool _isAgreed = false;

  // Dropdown
  String? _selectedCategory;
  final List<String> _categories = [
    "Elektronik",
    "Pakaian",
    "Makanan",
    "Lainnya",
  ];

  // States untuk Date Picker
  DateTime? _selectedDate;

  // States untuk Time Picker
  TimeOfDay? _selectedTime;

  // Fungsi Picker

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  // Builder Konten Halaman (Body)

  Widget _buildBodyContent() {
    switch (_currentMenu) {
      case 'Syarat & Ketentuan':
        return _buildCheckboxForm();
      case 'Atur Mode Gelap':
        return _buildDarkModeSwitchForm(); // Widget Switch Dark Mode
      case 'Pilih Kategori Produk':
        return _buildDropdownForm(); // Widget Dropdown
      case 'Pilih Tanggal Lahir':
        return _buildDatePickerForm(); // Widget Date Picker
      case 'Atur Pengingat':
        return _buildTimePickerForm(); // Widget Time Picker
      default:
        return const Center(
          child: Text(
            "Selamat datang! Silakan pilih menu interaktif dari Drawer.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        );
    }
  }

  // 1. Form Checkbox (Syarat & Ketentuan)
  Widget _buildCheckboxForm() {
    final statusText = _isAgreed
        ? "Lanjutkan pendaftaran diperbolehkan"
        : "Anda belum bisa melanjutkan";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Checkbox(
              value: _isAgreed,
              onChanged: (bool? value) {
                setState(() {
                  _isAgreed = value!;
                });
              },
            ),
            const Text("Saya menyetujui semua persyaratan yang berlaku"),
          ],
        ),
        const SizedBox(height: 20),
        _buildResultBox(
          title: "Status Persetujuan:",
          content: statusText,
          color: _isAgreed ? Colors.green.shade100 : Colors.red.shade100,
          textColor: _isAgreed ? Colors.green.shade800 : Colors.red.shade800,
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton(
            onPressed: _isAgreed
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Tugas4()),
                    );
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: _isAgreed
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade400,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: const Text('Login', style: TextStyle(fontSize: 18)),
          ),
        ),
      ],
    );
  }

  // 2. Form Switch Mode Gelap (Mengontrol state global)
  Widget _buildDarkModeSwitchForm() {
    final isDark = widget.isDarkMode;
    final statusText = isDark
        ? "Tema Saat Ini: Mode Gelap (Dark Mode)"
        : "Tema Saat Ini: Mode Terang (Light Mode)";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Aktifkan Mode Gelap:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Switch(
              value: isDark,
              onChanged: (bool value) {
                // Panggil callback ke widget utama untuk mengubah tema global
                widget.onToggleTheme(value);
              },
              activeTrackColor: Colors.blue.shade200,
              activeColor: Colors.blueAccent,
            ),
          ],
        ),
        const SizedBox(height: 20),
        _buildResultBox(
          title: "Status Mode Tema:",
          content: statusText,
          color: isDark ? Colors.grey.shade700 : Colors.blue.shade50,
          textColor: isDark ? Colors.white : Colors.blue.shade800,
        ),
      ],
    );
  }

  // 3. Form Dropdown (Pilih Kategori Produk)
  Widget _buildDropdownForm() {
    final statusText = _selectedCategory != null
        ? "Anda memilih kategori: $_selectedCategory"
        : "Silakan pilih salah satu kategori produk.";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Pilih Kategori Produk:",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
          ),
          hint: const Text("Pilih Kategori"),
          value: _selectedCategory,
          items: _categories.map((String category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Text(category),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedCategory = newValue;
            });
          },
        ),
        const SizedBox(height: 20),
        _buildResultBox(
          title: "Pilihan Kategori:",
          content: statusText,
          color: Colors.blue.shade50,
          textColor: Colors.blue.shade800,
        ),
      ],
    );
  }

  // 4. Form Date Picker
  String _formatDate(DateTime date) {
    const monthNames = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    return "${date.day} ${monthNames[date.month - 1]} ${date.year}";
  }

  Widget _buildDatePickerForm() {
    final statusText = _selectedDate != null
        ? "Tanggal Lahir: ${_formatDate(_selectedDate!)}"
        : "Silakan tekan tombol untuk memilih tanggal lahir.";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton.icon(
          onPressed: () => _selectDate(context),
          icon: const Icon(Icons.calendar_today),
          label: const Text("Pilih Tanggal Lahir"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 20),
        _buildResultBox(
          title: "Detail Tanggal Lahir:",
          content: statusText,
          color: Colors.teal.shade50,
          textColor: Colors.teal.shade800,
        ),
      ],
    );
  }

  // 5. Form Time Picker
  Widget _buildTimePickerForm() {
    final statusText = _selectedTime != null
        ? "Pengingat diatur pukul: ${_selectedTime!.format(context)}"
        : "Silakan tekan tombol untuk mengatur waktu pengingat.";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton.icon(
          onPressed: () => _selectTime(context),
          icon: const Icon(Icons.access_time),
          label: const Text("Pilih Waktu Pengingat"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 20),
        _buildResultBox(
          title: "Detail Pengingat:",
          content: statusText,
          color: Colors.purple.shade50,
          textColor: Colors.purple.shade800,
        ),
      ],
    );
  }

  //  Widget Box Hasil Output
  Widget _buildResultBox({
    required String title,
    required String content,
    required Color color,
    required Color textColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: textColor.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: textColor.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            content,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  // Helper untuk Item Drawer
  Widget _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      selected: _currentMenu == title,
      onTap: () {
        setState(() {
          _currentMenu = title;
        });
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_currentMenu)),
      // Drawer (Navigasi)
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Text(
                'Menu Input Interaktif',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            _buildDrawerItem(Icons.verified_user, 'Syarat & Ketentuan'),
            _buildDrawerItem(
              Icons.brightness_2,
              'Atur Mode Gelap',
            ), // Kunci: Menu terpisah untuk Dark Mode
            _buildDrawerItem(Icons.category, 'Pilih Kategori Produk'),
            _buildDrawerItem(Icons.cake, 'Pilih Tanggal Lahir'),
            _buildDrawerItem(Icons.alarm, 'Atur Pengingat'),
          ],
        ),
      ),
      // Body (Konten Form)
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _buildBodyContent(),
      ),
    );
  }
}
