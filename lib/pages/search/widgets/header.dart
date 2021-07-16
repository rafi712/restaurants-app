import 'package:flutter/material.dart';
import 'package:restaurants_app/pages/search/widgets/search_field.dart';

class Header extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, top: 15),
      child: Row(
        children: [
          IconButton(
            splashRadius: 1,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.yellow[800],
              size: 28,
            )
          ),
          SizedBox(width: 5),
          Expanded(child: SearchField()),
        ],
      ),
    );
  }
}
