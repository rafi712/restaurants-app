import 'package:flutter/material.dart';
import 'package:restaurants_app/pages/detail/widgets/add_review_modal.dart';

class ReviewsHeader extends StatelessWidget {
  final String id;
  ReviewsHeader({required this.id});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Reviews',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextButton( 
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => AddReviewModal(),
            );
          },
          child: Text('Add Review'),
          style: TextButton.styleFrom(
            primary: Colors.red[600],
            textStyle: Theme.of(context).textTheme.bodyText1!
              .copyWith(fontWeight: FontWeight.w600)
          ),
        ),
      ],
    );
  }
}

