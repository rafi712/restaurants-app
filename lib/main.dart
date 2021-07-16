import 'package:flutter/material.dart';

import 'package:restaurants_app/pages/search/search_page.dart';
import 'package:restaurants_app/pages/detail/detail_page.dart';
import 'package:restaurants_app/pages/home/home_page.dart';
import 'package:restaurants_app/common/styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: MaterialColor(0xff, swatch),
        textTheme: textTheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
      ),
      title: 'GetRestaurants',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        SearchPage.routeName: (context) => SearchPage(),
        DetailPage.routeName: (context) => DetailPage(
          id: ModalRoute.of(context)?.settings.arguments as String
        ),
      },
    );
  }
}

