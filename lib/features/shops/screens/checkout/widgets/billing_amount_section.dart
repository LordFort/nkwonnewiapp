import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$1000', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping fee', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$50', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax fee', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$50', style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),const SizedBox(height: TSizes.spaceBtwItems / 2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$50', style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),

      ],
    );
  }
}
