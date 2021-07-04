import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final num rating;
  const RatingStars({required this.rating});

  Icon buildStar(int index) {
    return Icon(
      Icons.star,
      size: 23,
      color: rating.floor() >= index
        ? Colors.yellow[600]
        : Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildStar(1),
        buildStar(2),
        buildStar(3),
        buildStar(4),
        buildStar(5),
        SizedBox(width: 3),
        Text(
          '$rating',
          style: Theme.of(context).textTheme.bodyText1,
        )
      ],
    );
  }
}

