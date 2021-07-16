import 'package:flutter/material.dart';
import 'package:restaurants_app/pages/search/widgets/header.dart';

class SearchPageBuilder extends StatelessWidget {
  final Widget? content;
  SearchPageBuilder({ this.content});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (content != null) content!,
        Header(),
      ],
    );
  }
}
