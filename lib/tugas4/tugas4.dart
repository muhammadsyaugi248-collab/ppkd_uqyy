import 'package:flutter/material.dart';

class Tugas4 extends StatelessWidget {
  const Tugas4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFBF9D1),
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "E-Sehat",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                foreground: Paint()
                  ..shader = LinearGradient(
                    colors: <Color>[
                      const Color.fromARGB(255, 0, 139, 253),
                      const Color.fromARGB(255, 248, 246, 121),
                      const Color.fromARGB(255, 67, 116, 69),
                    ],
                    begin: Alignment.topLeft,
                    end: AlignmentGeometry.bottomRight,
                  ).createShader(Rect.fromLTWH(0, 40, 380, 100)),
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.local_hospital, color: Colors.redAccent),
          ],
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nama",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Masukkan Nama Anda ",
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "E-mail",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),

                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "i'munderwater123@gmail.combro",
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "No-Hp",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "62+ ...",
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Deskripsikan Diri Anda",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  maxLines: 2,
                  // minLines: 1,
                  // expands: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: " ..... ",
                  ),
                ),

                //Paracetamol
                SizedBox(height: 10),
                ListTile(
                  //Beras
                  tileColor: Color.fromARGB(255, 1, 167, 23),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/p.jpg"),
                  ),
                  title: Text(
                    'Paracetamol',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Rp. 150.000/Box',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),

                //Fresh care
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/f.jpg"),
                  ),
                  title: Text(
                    'Fresh care',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Rp 2.000/botol',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),

                //Balsem
                ListTile(
                  tileColor: Color.fromARGB(255, 1, 167, 23),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/bo.jpg"),
                  ),
                  title: Text(
                    'balsem geligak?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Rp 17.500/kg',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),

                //Promag
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/pm.jpg"),
                  ),
                  title: Text(
                    'Promag',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Rp 15.000/tablet',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),

                //koyo
                ListTile(
                  tileColor: Color.fromARGB(255, 1, 167, 23),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/k.jpg"),
                  ),
                  title: Text(
                    'Koyo',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Rp 11.000.0000.000/pcs',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/b.jpg"),
                  ),
                  title: Text(
                    'Betadine',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Rp 15.0000.0000/botol',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
