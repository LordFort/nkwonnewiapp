import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/icons/t_circular_icons.dart';
import '../../../../../common/widgets/products/carts/add_remove_button.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product/cart_controller.dart';
import '../../../models/product_model.dart';


class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? TColors.darkerGrey : TColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        ),
      ),
      child: Obx(
            () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Add OR Remove Cart Product Icon Buttons
            TProductQuantityWithAddRemoveButton(
              quantity: controller.productQuantityInCart.value,
              add: () => controller.productQuantityInCart.value += 1,
              // Disable remove when cart count is less then 1
              remove: () => controller.productQuantityInCart.value < 1 ? null : controller.productQuantityInCart.value -= 1,
            ),
            // Add to cart button
            ElevatedButton(
              onPressed: controller.productQuantityInCart.value < 1 ? null : () => controller.addToCart(product),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: TColors.black,
                side: const BorderSide(color: TColors.black),
              ),
              child: const Row(
                children: [Icon(Iconsax.shopping_bag), SizedBox(width: TSizes.spaceBtwItems / 2), Text('Add to Bag')],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
