import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../features/shops/controllers/product/cart_controller.dart';
import '../../../../../features/shops/models/product_model.dart';
import '../../../../../features/shops/screens/product_detail/product_detail.dart';
import '../../../../../features/utils/constants/colors.dart';
import '../../../../../features/utils/constants/enums.dart';
import '../../../../../features/utils/constants/sizes.dart';



class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return GestureDetector(
      onTap: () {
        // If the product have variations then show the product Details for variation selection.
        // ELse add product to the cart.
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(() => ProductDetailScreen(product: product));
        }
      },
      child: Obx(
        () {
          final productQuantityInCart = cartController.getProductQuantityInCart(product.id);
          return AnimatedContainer(
            curve: Curves.easeInOutCubicEmphasized,
            decoration: BoxDecoration(
              color: productQuantityInCart > 0 ? TColors.primary : TColors.dark,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(TSizes.cardRadiusMd),
                bottomRight: Radius.circular(TSizes.productImageRadius),
              ),
            ),
            duration: const Duration(milliseconds: 300),
            child: SizedBox(
              width: TSizes.iconLg * 1.2,
              height: TSizes.iconLg * 1.2,
              child: Center(
                child: productQuantityInCart > 0
                    ? Text(productQuantityInCart.toString(), style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.white))
                    : const Icon(Iconsax.add, color: TColors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
