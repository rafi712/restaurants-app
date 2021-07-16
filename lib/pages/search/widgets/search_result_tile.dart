import 'package:flutter/material.dart';
import 'package:restaurants_app/pages/detail/detail_page.dart';
import 'package:restaurants_app/provider/restaurants_provider.dart';
import 'package:provider/provider.dart';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

class SearchResultTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final result = context.read<RestaurantProvider>().restaurants;
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: result.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context, DetailPage.routeName,
              arguments: result[index].id
            );
          },
          child: Container(
            height: 100,
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color: Colors.orange[100],
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(1, 1),
                  blurRadius: 4
                )
              ]
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FancyShimmerImage(                
                      width: 100,
                      shimmerBaseColor: Colors.grey[300],
                      shimmerBackColor: Colors.white,
                      shimmerHighlightColor: Colors.grey[200],
                      imageUrl: 'https://restaurant-api.dicoding.dev/images/medium/${result[index].pictureId}',
                      boxFit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          result[index].name,
                          style: Theme.of(context).textTheme.headline6!
                            .copyWith(fontSize: 18),
                        ),
                        SizedBox(height: 7),
                        Text(
                          result[index].city,
                          style: Theme.of(context).textTheme.bodyText1
                        ),
                      ],
                    ),
                  )
                )
              ],
            ),
          ),
        );
      },
    );
  }
}