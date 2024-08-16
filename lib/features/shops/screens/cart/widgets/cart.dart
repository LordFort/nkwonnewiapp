import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../common/loaders/animation_loader.dart';
import '../../../../../common/widgets/App_bar/appbar.dart';
import '../../../../../home_menu.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../controllers/product/cart_controller.dart';
import '../../checkout/checkout.dart';
import '../cart_items(checkoutscren).dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    final cartItems = controller.cartItems;
    return Scaffold(
      /// -- AppBar
      appBar: TAppBar(showBackArrow: true, title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: Obx(() {
        /// Nothing Found Widget
        final emptyWidget = TAnimationLoaderWidget(
          text: 'Whoops! Cart is EMPTY.',
          animation: TImages.cartAnimation,
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPressed: () => Get.off(() => const HomeMenu()),
        );

        /// Cart Items
        return cartItems.isEmpty
            ? emptyWidget
            : const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),

            /// -- Items in Cart
            child: TCartItems(),
          ),
        );
      }),

      /// -- Checkout Button
      bottomNavigationBar: Obx(
            () {
          return cartItems.isNotEmpty
              ? Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const CheckoutScreen()),
                child: Obx(() => Text('Checkout ${controller.totalCartPrice.value}')),
              ),
            ),
          )
              : const SizedBox();
        },
      ),
    );
  }
}