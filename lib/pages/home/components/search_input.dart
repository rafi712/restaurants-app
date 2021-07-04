import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        textInputAction: TextInputAction.search,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          hintText: 'Search Restaurant...',
          fillColor: Colors.grey[200],
          filled: true,
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.only(left: 13),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.transparent)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.transparent)
          ),
        ),
      ),
    );
  }
}

