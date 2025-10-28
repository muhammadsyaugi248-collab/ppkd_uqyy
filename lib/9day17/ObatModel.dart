// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class ObatModel {
  final String name;
  final int price;
  final String condition;
  final String image;
  final Color? backgroundColor;
  ObatModel({
    required this.name,
    required this.price,
    required this.condition,
    required this.image,
    this.backgroundColor,
  });
}
