import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  final String pictureId;
  const HeaderImage({required this.pictureId});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(2, 3),
            blurRadius: 5,
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      height: 270,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: FancyShimmerImage(
          shimmerBaseColor: Colors.grey[300],
          shimmerBackColor: Colors.white,
          shimmerHighlightColor: Colors.grey[200],
          imageUrl: 'https://restaurant-api.dicoding.dev/images/medium/$pictureId',
          boxFit: BoxFit.cover,
        ),
      ),
    );
  }
}
