import 'package:flutter/material.dart';

import '../../detail/detail_page.dart';
import '/model/restaurant.dart';

class RestaurantsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          final List<Restaurant> restaurants = getRestaurant(snapshot.data);

          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: restaurants.length,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.symmetric(vertical: 25),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context, DetailPage.routeName,
                    arguments: restaurants[index]
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
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(2, 2),
                              blurRadius: 5,
                            )
                          ]
                        ),
                        child: Hero(
                          tag: restaurants[index].id,
                          child: Image.network(
                            restaurants[index].pictureId,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          restaurants[index].name,
                          style: Theme.of(context).textTheme.headline5!.copyWith(
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
                                Icon(Icons.place_outlined, size: 15,),
                                Text(
                                  restaurants[index].city,
                                  style: Theme.of(context).textTheme.bodyText2,
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
                                  restaurants[index].rating.toString(),
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
          );
        },
      ),
    );
  }
}