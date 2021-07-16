import 'package:flutter/material.dart';

class DrinksList extends StatelessWidget {
  final List<String> drinks;
  const DrinksList({required this.drinks});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: drinks.length,
      itemBuilder: (context, index) => Container(
        height: 90,
        child: Row(
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
                  image: AssetImage('assets/images/drinks.jpg'),
                  fit: BoxFit.cover
                ),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    drinks[index],
                    style: TextStyle(
                      fontSize: 17
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
              ),
            )
          ],
        ),
      ),
    );
  }
}

