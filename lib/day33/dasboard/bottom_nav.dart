import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:ppkd_uqyy/day33/view/profil.dart';
import 'package:ppkd_uqyy/day_31/views/product_detail_screen.dart';
import 'package:ppkd_uqyy/day_31/views/product_list_screen.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    // Center(child: Text("Home")),
    ProductListScreen(),
    ProfilePage(),
    // Scaffold(body: Text("maintaince"),),
    // Scaffold(body: Text("maintaince"),),
    // Scaffold(body: Text("maintaince"),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black,
        items: [
          CurvedNavigationBarItem(
            child: Icon(Icons.shopping_bag_outlined),
            label: 'Shop',
          ),
          // CurvedNavigationBarItem(
          //   child: Icon(Icons.monitor_heart_outlined),
          //   label: 'health',
          // ),
          // CurvedNavigationBarItem(
          //   child: Icon(Icons.qr_code_2_rounded),
          //   label: 'scan',
          // ),
          CurvedNavigationBarItem(
            child: Icon(Icons.perm_identity),
            label: 'Personal',
          ),
          // CurvedNavigationBarItem(
          //   child: Icon(Icons.settings),
          //   label: 'settings',
          // ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}