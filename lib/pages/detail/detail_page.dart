import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:restaurants_app/provider/restaurant_detail_provider.dart';
import 'package:restaurants_app/provider/restaurants_provider.dart';
import 'package:restaurants_app/common/widgets/no_connection_screen.dart';
import 'package:restaurants_app/pages/detail/widgets/reviews_list.dart';
import 'package:restaurants_app/pages/detail/widgets/detail_page_shimmer.dart';
import 'package:restaurants_app/pages/detail/widgets/menus_tile.dart';
import 'package:restaurants_app/pages/detail/widgets/reviews_header.dart';
import 'package:restaurants_app/pages/detail/widgets/more_review_button.dart';
import 'package:restaurants_app/pages/detail/widgets/location_widget.dart';
import 'package:restaurants_app/pages/detail/widgets/custom_back_button.dart';
import 'package:restaurants_app/pages/detail/widgets/header_image.dart';
import 'package:restaurants_app/pages/detail/widgets/rating_stars.dart';
import 'package:restaurants_app/pages/detail/widgets/categories_chips.dart';

class DetailPage extends StatelessWidget {
  static String routeName = '/detail';
  final String id;
  DetailPage({required this.id});  

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RestaurantDetailProvider(id: id),
      child: Scaffold(
        body: Stack(
          children: [
            Consumer<RestaurantDetailProvider>(
              builder: (context, provider, child) {
                if (provider.state == ResultState.noConnection) {
                  return NoConnectionScreen(id: id, detailProvider: provider);
                } else if (provider.state == ResultState.loading) {
                  return DetailPageShimmer();
                } else if (provider.state == ResultState.error) {
                  return Center(child: Text(provider.message));
                } else if (provider.state == ResultState.hasData) {
                  final restaurant = provider.restaurant;

                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        HeaderImage(pictureId: restaurant.pictureId),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              SizedBox(height: 10),
                              RatingStars(rating: restaurant.rating),
                              SizedBox(height: 20),
                              LocationWidget(
                                city: restaurant.city,
                                address: restaurant.address,
                              ),
                              SizedBox(height: 15),
                              CategoriesChips(categories: restaurant.categories),
                              SizedBox(height: 50),
                              Text(
                                restaurant.description,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              SizedBox(height: 20),
                              MenusTile(context: context),
                              Divider(color: Colors.red, height: 30),
                              ReviewsHeader(id: restaurant.id),
                              ReviewsList(context: context),
                              if (restaurant.customerReviews.length > 2)
                              MoreReviewsButton(context: context),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              },
            ),
            CustomBackButton(),
          ],
        ),
      ),
    );
  }
}

