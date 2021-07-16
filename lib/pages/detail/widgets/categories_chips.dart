import 'package:flutter/material.dart';

class CategoriesChips extends StatelessWidget {
  final List<String> categories;
  const CategoriesChips({required this.categories});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: categories.map((category) {
        return Chip(
          backgroundColor: Colors.yellow[700],
          label: Text(category),
        );
      }).toList()
    );
  }
}

