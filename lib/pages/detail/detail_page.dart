import 'package:flutter/material.dart';
import 'package:news_app/model/restaurant.dart';
import 'package:news_app/pages/detail/components/drinks_list.dart';

import 'components/custom_back_button.dart';
import 'components/foods_list.dart';
import 'components/header_image.dart';
import 'components/rating_stars.dart';

class DetailPage extends StatelessWidget {
  static String routeName = '/detail';
  final Restaurant restaurant;

  DetailPage({required this.restaurant});

  Border _bottomBorder() {
    return Border(
      bottom: BorderSide(
        color: Colors.red,
        width: 3
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(              
              children: [
                HeaderImage(pictureUrl: restaurant.pictureId),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              restaurant.name,
                              style: Theme.of(context).textTheme.headline4!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Row(
                              children: [
                                Icon(Icons.place_outlined, size: 23),
                                SizedBox(width: 5),
                                Text(
                                  restaurant.city,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      RatingStars(rating: restaurant.rating),
                      SizedBox(height: 40),
                      Container(
                        padding: EdgeInsets.only(bottom: 3),
                        decoration: BoxDecoration(
                          border: _bottomBorder(),
                        ),
                        child: Text(
                          'Description',
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        restaurant.description,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.only(bottom: 3),
                        decoration: BoxDecoration(
                          border: _bottomBorder()
                        ),
                        child: Text(
                          'Foods',
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      FoodsList(foods: restaurant.foods),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.only(bottom: 3),
                        decoration: BoxDecoration(
                          border: _bottomBorder()
                        ),
                        child: Text(
                          'Drinks',
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
		      SizedBox(height: 20),
                      DrinksList(drinks: restaurant.drinks),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CustomBackButton(),
        ],
      ),
    );
  }
}

