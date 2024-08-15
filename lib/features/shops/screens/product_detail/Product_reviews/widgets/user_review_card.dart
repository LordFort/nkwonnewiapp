import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../../common/widgets/products/Ratings/rating_indicator.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
        const CircleAvatar(backgroundImage: AssetImage(TImages.userProfileImage1),),
        const SizedBox(width: TSizes.spaceBtwItems,),
        Text('Fortunate Chimdindu', style: Theme.of(context).textTheme.titleLarge,),
        ],
    ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
    ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),

        Row(
          children: [
            const TRatingIndicator(rating: 4,),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('16 Nov 2024', style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
         const SizedBox(height: TSizes.spaceBtwItems,),
        const ReadMoreText(
          'Thanks to Fortunate, for defeating the limitations to app development and delivering unto us this wonderful app',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'Show less',
          trimCollapsedText: 'show more',
          moreStyle:  TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey: TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Fort Store", style: Theme.of(context).textTheme.titleMedium,),
                    Text('17 Nov 2024', style: Theme.of(context).textTheme.bodyMedium,),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems,),
                const ReadMoreText(
                  'Thanks to Fortunate, for defeating the limitations to app development and delivering unto us this wonderful app',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'Show less',
                  trimCollapsedText: 'show more',
                  moreStyle:  TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
      ],
    );
  }
}
