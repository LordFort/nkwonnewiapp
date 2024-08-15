import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../common/widgets/App_bar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../checkout/checkout.dart';
import '../cart_items(checkoutscren).dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TAppBar(
          title: Text(
            'Cart',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          showBackArrow: true,
        ),
        body: const Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: TCartItems(),),

    
    bottomNavigationBar: Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: ElevatedButton(onPressed: () => Get.to(() => const CheckoutScreen()), child: const Text('Checkout \$1000.00'),),
    ),
    );
  }
}
