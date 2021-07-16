import 'package:flutter/material.dart';
import 'package:restaurants_app/common/widgets/custom_shimmer.dart';

class DetailPageShimmer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomShimmer(
            height: 270,
            width: double.infinity,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomShimmer(width: 150, height: 25),
                SizedBox(height: 20),
                CustomShimmer(height: 15,width: 150),
                SizedBox(height: 30),
                Row(
                  children: [
                    CustomShimmer(
                      height: 30,
                      width: 30,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomShimmer(height: 10, width: 50),
                        SizedBox(height: 8),
                        CustomShimmer(height: 10, width: 80),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    CustomShimmer(
                      height: 30,
                      width: 80,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    SizedBox(width: 8),
                    CustomShimmer(
                      height: 30,
                      width: 80,
                      borderRadius: BorderRadius.circular(16),
                    )
                  ],
                ),
                SizedBox(height: 70),
                CustomShimmer(height: 15, width: double.infinity),
                SizedBox(height: 10),
                CustomShimmer(height: 15, width: double.infinity),
                SizedBox(height: 10),
                CustomShimmer(height: 15, width: double.infinity),
                SizedBox(height: 10),
                CustomShimmer(height: 15, width: double.infinity),
                SizedBox(height: 10),
                CustomShimmer(height: 15, width: double.infinity),
                SizedBox(height: 10),
                CustomShimmer(height: 15, width: double.infinity),
                SizedBox(height: 10),
                CustomShimmer(height: 15, width: double.infinity),
                SizedBox(height: 10),
                CustomShimmer(height: 15, width: double.infinity),
                SizedBox(height: 10),
                CustomShimmer(height: 15, width: double.infinity),
                SizedBox(height: 10),
                CustomShimmer(height: 15, width: double.infinity),
              ],
            ),
          ),
        ],
      ),
    );
  }
}