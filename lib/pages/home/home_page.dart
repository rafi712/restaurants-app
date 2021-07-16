import 'package:flutter/material.dart';
import 'package:restaurants_app/pages/search/search_page.dart';

import 'package:restaurants_app/pages/home/widgets/restaurants_list.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/';

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
                      Icon(
                        Icons.place_outlined,
                        color: Colors.red[600],
                        size: 26,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Indonesia',
                        style: TextStyle(
                          fontSize: 16
                        ),
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
                SizedBox(height: 30),
                RestaurantsList(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, SearchPage.routeName);
        },
        child: Icon(Icons.search_rounded, size:28),
        backgroundColor: Colors.yellow[800],
      )
    );
  }
}
