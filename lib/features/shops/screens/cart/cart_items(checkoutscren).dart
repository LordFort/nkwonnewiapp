import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../../common/widgets/products/carts/add_remove_button.dart';
import '../../../../common/widgets/products/carts/cart_item.dart';
import '../../../../common/widgets/products/product_price_text.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../controllers/product/cart_controller.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final cartItems = cartController.cartItems;
    return Obx(
          () {
        return ListView.separated(
          shrinkWrap: true,
          itemCount: cartItems.length,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(height: TSizes.spaceBtwSections),
          itemBuilder: (context, index) {
            return Obx(
                  () {
                final item = cartItems[index];
                return Column(
                  children: [
                    /// -- Cart Items
                    TCartItem(item: item),
                    if (showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems),

                    /// -- Add Remove Buttons and Price Total
                    if (showAddRemoveButtons)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// -- Add Remove Buttons
                          Row(
                            children: [
                              // Use to add space to the left of Buttons as image space.
                              const SizedBox(width: 70),

                              /// Add Remove Buttons
                              TProductQuantityWithAddRemoveButton(
                                width: 32,
                                height: 32,
                                iconSize: TSizes.md,
                                addBackgroundColor: TColors.primary,
                                removeForegroundColor: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
                                removeBackgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
                                quantity: item.quantity,
                                add: () => cartController.addOneToCart(item),
                                remove: () => cartController.removeOneFromCart(item),
                              ),
                            ],
                          ),

                          /// -- Product total price
                          TProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                        ],
                      )
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
