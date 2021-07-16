import 'package:flutter/material.dart';
import 'package:restaurants_app/provider/restaurants_provider.dart';
import 'package:provider/provider.dart';

class SearchField extends StatefulWidget {
  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late TextEditingController controller;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<RestaurantProvider>();

    return TextField(
      textInputAction: TextInputAction.search,
      focusNode: focusNode,
      cursorColor: Colors.grey,
      controller: controller,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Search name, menu, category...',
        fillColor: Colors.grey[200],
        filled: true,
        prefixIcon: Icon(Icons.search),
        contentPadding: EdgeInsets.only(left: 13),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.transparent)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.transparent)
        ),
      ),
      onSubmitted: (value) {
        if (value.trim().isEmpty) {
          controller.text = '';
          focusNode.requestFocus();
        } else {
          provider.searchRestaurants(value.trim());
        }
      },
    );
  }
}

