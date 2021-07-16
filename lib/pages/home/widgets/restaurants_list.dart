import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

import 'package:restaurants_app/common/widgets/no_connection_screen.dart';
import 'package:restaurants_app/pages/home/widgets/home_page_shimmer.dart';
import 'package:restaurants_app/provider/restaurants_provider.dart';
import 'package:restaurants_app/pages/detail/detail_page.dart';
import 'package:restaurants_app/model/restaurant.dart';

class RestaurantsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RestaurantProvider(),
      child: Consumer<RestaurantProvider>(
        builder: (context, provider, _) {
          if (provider.state == ResultState.noConnection) {
            return NoConnectionScreen(provider: provider);
          } else if (provider.state == ResultState.loading) {
            return HomePageShimmer();
          } else if (provider.state == ResultState.error) {
            return Center(child: Text(provider.message));
          } else if (provider.state == ResultState.noData) {
            return Center(child: Text(provider.message));
          } else if (provider.state == ResultState.hasData) {
            List<Restaurant> list = provider.restaurants;
    
            return Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.symmetric(vertical: 25),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context, DetailPage.routeName,
                          arguments: list[index].id
                        );
                      },
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(2, 2),
                                    blurRadius: 5,
                                  ),
                                ],                                
                              ),
                              child: FancyShimmerImage(
                                shimmerBaseColor: Colors.grey[300],
                                shimmerBackColor: Colors.white,
                                shimmerHighlightColor: Colors.grey[200],
                                imageUrl: 'https://restaurant-api.dicoding.dev/images/medium/${list[index].pictureId}',
                                boxFit: BoxFit.cover,                                
                              )
                            ),
                            SizedBox(height: 15),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                list[index].name,
                                style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                  ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.place_outlined,
                                        size: 15,
                                      ),
                                      Text(
                                        list[index].city,
                                        style:
                                            Theme.of(context).textTheme.bodyText2,
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow[600],
                                        size: 20,
                                      ),
                                      Text(
                                        list[index].rating.toString(),
                                        style: Theme.of(context).textTheme.bodyText2,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              );
            }
          return Text('');
        }
      ),
    );
  }
}
