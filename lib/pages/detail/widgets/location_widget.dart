import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  final String city, address;
  LocationWidget({required this.city, required this.address});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.place_outlined,
          size: 30,
          color: Colors.red[600],
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              city,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              address,
              style: Theme.of(context).textTheme.bodyText1!
                .copyWith(color: Colors.grey[700]),
            ),
          ],
        ),
      ],
    );
  }
}

