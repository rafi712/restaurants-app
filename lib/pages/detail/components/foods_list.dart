import 'package:flutter/material.dart';

class FoodsList extends StatelessWidget {
  final List<String> foods;
  const FoodsList({required this.foods});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: foods.length,
      itemBuilder: (context, index) => Container(
        height: 90,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: 20, bottom: 15),
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1, 1),
                    blurRadius: 3,
                  )
                ],
                image: DecorationImage(
                  image: AssetImage('assets/foods.jpg'),
                  fit: BoxFit.cover
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    foods[index],
                    style: TextStyle(
                      fontSize: 17
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  'Rp10.000',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600]
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

