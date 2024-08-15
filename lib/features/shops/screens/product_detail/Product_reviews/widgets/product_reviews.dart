import 'package:flutter/material.dart';
import 'package:sparvoll_the_app/features/shops/screens/product_detail/Product_reviews/widgets/rating_progeress_indicator.dart';
import 'package:sparvoll_the_app/features/shops/screens/product_detail/Product_reviews/widgets/user_review_card.dart';
import '../../../../../../common/widgets/App_bar/appbar.dart';
import '../../../../../../common/widgets/products/Ratings/rating_indicator.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: const TAppBar(title: Text('Reviews and Ratings', ), showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Ratings and reviews are verified and are from people who use the same type of device that you use."),
            const SizedBox(height: TSizes.spaceBtwItems,),
            const TOverallProductRating(),
            const TRatingIndicator(rating: 3.5,),
            Text('12,611', style: Theme.of(context).textTheme.bodySmall,),
            const SizedBox(height: TSizes.spaceBtwSections,),
            const UserReviewCard(),
            const UserReviewCard(),
          ],
        ),

        ),
      ),
    );
  }
}



