import 'package:flutter/material.dart';

import 'package:restaurants_app/pages/detail/widgets/reviews_list.dart';

class ReviewsModal extends StatelessWidget {
  final BuildContext context;
  const ReviewsModal({required this.context});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.pop(context),
      child: GestureDetector(
        onTap: () {},
        child: DraggableScrollableSheet(
          initialChildSize: 0.6,
          maxChildSize: 1,
          minChildSize: 0.4,
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
                  padding: const EdgeInsets.only(top: 20),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Text(
                        'Reviews',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                        ),
                      ),
                      SizedBox(height: 20),
                      ReviewsList(context: this.context, showAll: true)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
