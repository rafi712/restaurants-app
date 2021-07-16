import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NotFoundScreen extends StatelessWidget {
  final String query;
  NotFoundScreen({required this.query});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            child: Lottie.asset('assets/lottie/not-found.json'),
          ),
          SizedBox(height: 15),
          Text(
            'Sorry, We couldn\'t find result \nfor  "$query"',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
    );
  }
}

