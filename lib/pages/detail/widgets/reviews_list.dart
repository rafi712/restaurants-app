import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:restaurants_app/provider/restaurant_detail_provider.dart';

class ReviewsList extends StatelessWidget {
  final BuildContext context;
  final bool showAll;
  const ReviewsList({
    required this.context,
    this.showAll = false,
  });

  @override
  Widget build(BuildContext context) {
    final provider = this.context.read<RestaurantDetailProvider>();
    
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: showAll ? provider.restaurant.customerReviews.length : 2,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                provider.restaurant.customerReviews[index].name,
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 5),
              Text(
                provider.restaurant.customerReviews[index].date,
                style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.grey[800]),
              ),
              SizedBox(height: 7),
              Text(
                provider.restaurant.customerReviews[index].review,
                style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.grey[600]),
              ),
            ],
          ),
        );
      },
    );
  }
}
