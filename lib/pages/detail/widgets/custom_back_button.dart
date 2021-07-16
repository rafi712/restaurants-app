import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 10, left: 10),
        padding: EdgeInsets.only(right: 3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.yellow[800],
          border: Border.all(
            color: Colors.white,
          )
        ),
        child: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 24,
            color: Colors.white,
          )
        ),
      )
    );
  }
}

