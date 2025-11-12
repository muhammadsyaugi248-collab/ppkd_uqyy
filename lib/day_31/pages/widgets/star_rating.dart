import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rate;
  const StarRating({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    int fullStars = rate.floor();
    bool halfStar = (rate - fullStars) >= 0.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < fullStars) {
          return const Icon(Icons.star, color: Colors.orange, size: 14);
        } else if (index == fullStars && halfStar) {
          return const Icon(Icons.star_half, color: Colors.orange, size: 14);
        } else {
          return const Icon(Icons.star_border, color: Colors.orange, size: 14);
        }
      }),
    );
  }
}
