import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  final String pictureUrl, id;
  const HeaderImage({required this.pictureUrl, required this.id});


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
      child: Hero(
        tag: id,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
          child: Image.network(
            pictureUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
