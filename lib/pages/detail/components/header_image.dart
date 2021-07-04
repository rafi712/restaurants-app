import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  final String pictureUrl;
  const HeaderImage({required this.pictureUrl});


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
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(pictureUrl)
        ),
      ),
      height: 270,
    );
  }
}
