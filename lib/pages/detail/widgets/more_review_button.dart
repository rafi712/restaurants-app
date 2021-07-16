import 'package:flutter/material.dart';

import 'package:restaurants_app/pages/detail/widgets/reviews_modal.dart';

class MoreReviewsButton extends StatelessWidget {
  final BuildContext context;
  const MoreReviewsButton({required this.context});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (_) => ReviewsModal(context: this.context),
          );
        },
        child: Text('See More Reviews'),
        style: TextButton.styleFrom(
          primary: Colors.red[600],
          textStyle: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontWeight: FontWeight.w600)),
      ),                                
    );
  }
}

