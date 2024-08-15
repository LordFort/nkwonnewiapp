import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sparvoll_the_app/features/shops/screens/checkout/widgets/billing_address_section.dart';
import 'package:sparvoll_the_app/features/shops/screens/checkout/widgets/billing_amount_section.dart';
import 'package:sparvoll_the_app/features/shops/screens/checkout/widgets/billing_payment_section.dart';
import '../../../../common/widgets/App_bar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/products/coupon/coupon_code.dart';
import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../home_menu.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../cart/cart_items(checkoutscren).dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TCartItems(showAddRemoveButtons: false,),
              const SizedBox(height: TSizes.spaceBtwSections,),
              
              const TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections,),

              TRoundedContainer(
                padding: const EdgeInsets.all(TSizes.md),
                showBorder: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems,),

                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems,),

                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems,),

                    TBillingAddressSection()


                  ],
                ),
              )
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding:  const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() =>  SuccessScreen(
          image: TImages.successfulPaymentIcon,
          title: 'Payment success',
          subTitle: 'Your item will be shipped soon',
          onPressed: () => Get.offAll(() => const HomeMenu()),
        ),),
          child: const Text('Checkout \$1000.00'),),
      ),
    );
  }
}

