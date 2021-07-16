import 'package:flutter/material.dart';
import 'package:restaurants_app/provider/restaurants_provider.dart';
import 'package:provider/provider.dart';

import 'package:restaurants_app/pages/search/widgets/search_result_tile.dart';

class SearchResultList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final count = context.read<RestaurantProvider>().restaurants.length;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Found $count ${count == 1 ? 'restaurant': 'restaurants'}',
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: 20),
                SearchResultTile(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}