import 'dart:ffi';

import 'package:flutter/material.dart';

class Tugas3 extends StatelessWidget {
  const Tugas3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView")),
      body: ListView(
        // scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(8),
        // shrinkWrap: true,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(height: 300, width: 300, color: Color(0xFF556B2F)),
              Container(height: 200, width: 200, color: Color(0xFF8FA31E)),
              Positioned(
                bottom: -20,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Color(0xFFC6D870),
                ),
              ),
            ],
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(height: 300, width: 300, color: Color(0xFF556B2F)),
              Container(height: 200, width: 200, color: Color(0xFF8FA31E)),
              Positioned(
                bottom: -20,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Color(0xFFC6D870),
                ),
              ),
            ],
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(height: 300, width: 300, color: Color(0xFF556B2F)),
              Container(height: 200, width: 200, color: Color(0xFF8FA31E)),
              Positioned(
                bottom: -20,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Color(0xFFC6D870),
                ),
              ),
            ],
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(height: 300, width: 300, color: Color(0xFF556B2F)),
              Container(height: 200, width: 200, color: Color(0xFF8FA31E)),
              Positioned(
                bottom: -20,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Color(0xFFC6D870),
                ),
              ),
            ],
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(height: 300, width: 300, color: Color(0xFF556B2F)),
              Container(height: 200, width: 200, color: Color(0xFF8FA31E)),
              Positioned(
                bottom: -20,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Color(0xFFC6D870),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
