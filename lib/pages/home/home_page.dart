import 'package:flutter/material.dart';

import 'components/restaurants_list.dart';
import 'components/search_input.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 35, bottom: 15),
                  child: Row(
                    children: [
                      Icon(Icons.place_outlined),
                      Text(
                        'Indonesia',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Find good',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontSize: 25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'restaurant around you',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontSize: 25),
                  ),
                ),
                SizedBox(height: 20),
                SearchInput(),
                SizedBox(height: 30),
                RestaurantsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
