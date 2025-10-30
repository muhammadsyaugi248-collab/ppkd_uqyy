// import 'package:delightful_toast/delight_toast.dart';
// import 'package:delightful_toast/toast/components/toast_card.dart';
import 'dart:developer';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:ppkd_uqyy/9day17/tugas9_2.dart';
import 'package:ppkd_uqyy/9day17/tugas9_3.dart';
import 'package:ppkd_uqyy/tugas2/tugas2.dart';
import 'package:ppkd_uqyy/tugas7/tugas7.dart';

//NOMOR 1
class Tugas9List extends StatefulWidget {
  const Tugas9List({super.key});
  @override
  State<Tugas9List> createState() => _Tugas9ListState();
}

class _Tugas9ListState extends State<Tugas9List> {
  final List<String> kategori = ["paracetamol", "balsem", "fresh care"];

  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final NotchBottomBarController _controller = NotchBottomBarController(
    index: 0,
  );

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// widget list
    final List<Widget> bottomBarPages = [
      Tugas9(),
      Tugas9Kategori(),
      Tugas4(),
      Tugas2(),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('kesehatan ku', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Color.fromARGB(255, 3, 218, 136),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          bottomBarPages.length,
          (index) => bottomBarPages[index],
        ),
      ),
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              /// Provide NotchBottomBarController
              notchBottomBarController: _controller,
              color: const Color.fromARGB(255, 255, 253, 253),
              showLabel: true,
              textOverflow: TextOverflow.visible,
              maxLine: 1,
              shadowElevation: 5,
              kBottomRadius: 28.0,

              // notchShader: const SweepGradient(
              //   startAngle: 0,
              //   endAngle: pi / 2,
              //   colors: [Colors.red, Colors.green, Colors.orange],
              //   tileMode: TileMode.mirror,
              // ).createShader(Rect.fromCircle(center: Offset.zero, radius: 8.0)),
              notchColor: Colors.black87,

              /// restart app if you change removeMargins
              removeMargins: false,
              bottomBarWidth: 500,
              showShadow: false,
              durationInMilliSeconds: 300,

              itemLabelStyle: const TextStyle(fontSize: 10),

              elevation: 1,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(Icons.home_filled, color: Colors.blueGrey),
                  activeItem: Icon(Icons.home_filled, color: Colors.blueAccent),
                  itemLabel: 'Page 1',
                ),
                BottomBarItem(
                  inActiveItem: Icon(Icons.star, color: Colors.blueGrey),
                  activeItem: Icon(Icons.star, color: Colors.blueAccent),
                  itemLabel: 'Page 2',
                ),
                BottomBarItem(
                  inActiveItem: Icon(Icons.settings, color: Colors.blueGrey),
                  activeItem: Icon(Icons.settings, color: Colors.pink),
                  itemLabel: 'Page 3',
                ),
                BottomBarItem(
                  inActiveItem: Icon(Icons.person, color: Colors.blueGrey),
                  activeItem: Icon(Icons.person, color: Colors.yellow),
                  itemLabel: 'Page 4',
                ),
              ],
              onTap: (index) {
                log('current selected index $index');
                _pageController.jumpToPage(index);
              },
              kIconSize: 24.0,
            )
          : null,
    );
  }
}
