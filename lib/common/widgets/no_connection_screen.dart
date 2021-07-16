import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:restaurants_app/provider/restaurant_detail_provider.dart';
import 'package:restaurants_app/provider/restaurants_provider.dart';

class NoConnectionScreen extends StatelessWidget {
  final RestaurantProvider? provider;
  final RestaurantDetailProvider? detailProvider;
  final String? id, query;
  NoConnectionScreen({
    this.provider,
    this.detailProvider,
    this.id,
    this.query,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 180,
            width: 180,
            child: Lottie.asset('assets/lottie/no-connection.json'),
          ),
          SizedBox(height: 15),
          Text(
            'No Connection',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5!
              .copyWith(fontSize: 23),
          ),
          SizedBox(height: 8),
          TextButton.icon(
            onPressed: () {
              if (id != null) {
                detailProvider!.refresh(id!);
              } else {
                provider!.refresh();
              }
              
            },
            icon: Icon(Icons.refresh),
            label: Text('Refresh'),
            style: ButtonStyle(
              textStyle: MaterialStateProperty.resolveWith(
                (states) => Theme.of(context).textTheme.headline6!
                  .copyWith(color: Colors.black)
              ),
              foregroundColor: MaterialStateProperty.resolveWith(
                (states) => Colors.yellow[900]
              ),
              overlayColor: MaterialStateProperty.resolveWith(
                (states)  => Colors.transparent
              )
            ),
          )
        ],
      ),
    );
  }
}

