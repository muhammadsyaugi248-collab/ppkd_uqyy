import 'package:flutter/material.dart';

class Tugas5 extends StatefulWidget {
  const Tugas5({super.key});

  @override
  State<Tugas5> createState() => _Tugas5State();
}

class _Tugas5State extends State<Tugas5> {
  bool showfavorite = true;
  bool showImage = true;
  bool showAll = true;
  bool showBox = true;
  num counter = 0;
  double counter1 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              counter++;
              setState(() {});
            },
            child: Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              counter--;
              setState(() {});
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.person),
            SizedBox(width: 8),
            Text("Tugas 5 M.Syaugi"),
          ],
        ),
        backgroundColor: Colors.brown,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(8.0),

            child: Column(
              children: [
                // if (showImage)
                //   Image.asset(
                //     "assets/images/habibie.jpg",
                //     height: 400,
                //     width: double.infinity,
                //   ),
                if (showImage) ...[
                  Image.asset(
                    "assets/images/HH.png",
                    height: 200,
                    width: double.infinity,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          showfavorite = !showfavorite;
                          setState(() {});
                        },
                        icon: Icon(
                          showfavorite
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                        ),
                      ),
                      Text(showfavorite ? "LIKE" : " "),
                    ],
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        Text(
                          showAll ? 'JANGAN LUPA BERNAFAS, JANGAN MANUAL' : ' ',
                          maxLines: 3,
                        ),
                        TextButton(
                          onPressed: () {
                            showAll = !showAll;
                            setState(() {});
                          },
                          child: Text('Lihat Selengkapnya'),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      print("Tampilkan gambar : $showImage");
                      showImage = !showImage;
                      setState(() {});
                    },
                    child: Text(showImage ? "Sembunyikan" : "Tampilkan"),
                  ),
                ] else ...[
                  Container(
                    height: 400,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "Muhammad Alexander",
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                    ),
                  ),
                ],
                IconButton(
                  onPressed: () {
                    print("Tampilkan gambar : $showImage");
                    showImage = !showImage;
                    setState(() {});
                  },
                  icon: Icon(
                    showImage ? Icons.visibility_off : Icons.visibility,
                    color: showImage ? Colors.red : Colors.blue,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: Center(
                    child: Text(
                      counter.toString(),
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {
                    print('Kotak Sentuh');
                    setState(() {
                      showBox = !showBox;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    color: Color(0xffE6CFA9),
                    child: Center(
                      child: Text(
                        showBox ? '  ' : 'ciluk bwahhhgg',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100),
                GestureDetector(
                  onDoubleTap: () {
                    print('Ditekan dua kali');
                    setState(() {
                      counter1 += 2;
                    });
                  },
                  onLongPress: () {
                    print('petet yang Lama');
                    setState(() {
                      counter1 += 3;
                    });
                  },
                  onTap: () {
                    print('petet sekali -_');
                    setState(() {
                      counter1++;
                    });
                  },
                  child: Text('di petet'),
                ),
                Center(child: Text('Jumlahnya : $counter1')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
