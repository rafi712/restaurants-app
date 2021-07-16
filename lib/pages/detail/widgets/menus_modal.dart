import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:restaurants_app/pages/detail/widgets/drinks_list.dart';
import 'package:restaurants_app/pages/detail/widgets/foods_list.dart';
import 'package:restaurants_app/provider/restaurant_detail_provider.dart';

class MenusModal extends StatelessWidget {
  final BuildContext context;
  MenusModal({required this.context});

  @override
  Widget build(BuildContext context) {
    final menus = this.context.read<RestaurantDetailProvider>().restaurant.menus;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.pop(context),
      child: GestureDetector(
        onTap: () {},
        child: DraggableScrollableSheet(
          initialChildSize: 0.5,
          maxChildSize: 0.8,
          minChildSize: 0.3,
          builder: (_, scrollController) => Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[400],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Text(
                        'Menus',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Foods',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(height: 15),
                      FoodsList(foods: menus.foods),
                      SizedBox(height: 25),
                      Text(
                        'Drinks',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(height: 15),
                      DrinksList(drinks: menus.drinks),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}