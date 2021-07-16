import 'package:flutter/material.dart';
import 'package:restaurants_app/common/widgets/custom_shimmer.dart';

class HomePageShimmer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.symmetric(vertical: 25),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomShimmer(
                  height: 150,
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(10),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: CustomShimmer(
                    height: 14,
                    width: 100,
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: CustomShimmer(
                    height: 14,
                    width: 100,
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}