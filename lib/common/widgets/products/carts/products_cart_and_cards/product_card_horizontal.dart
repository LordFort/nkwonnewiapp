import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../features/shops/controllers/product/product_controller.dart';
import '../../../../../features/shops/models/product_model.dart';
import '../../../../../features/shops/screens/product_detail/product_detail.dart';
import '../../../../../features/shops/screens/store/wishlist/wishlist.dart';
import '../../../../../features/utils/constants/colors.dart';
import '../../../../../features/utils/constants/enums.dart';
import '../../../../../features/utils/constants/image_strings.dart';
import '../../../../../features/utils/constants/sizes.dart';
import '../../../../../features/utils/helpers/helper_functions.dart';
import '../../../custom_shapes/containers/rounded_container.dart';
import '../../../icons/t_circular_icons.dart';
import '../../../images/t_rounded_images.dart';
import '../../../texts/t_brand_title_text_with_verified_icon.dart';
import '../../../texts/t_product_title_text.dart';
import '../../products_cards/widgets/add_to_cart_button.dart';
import '../../products_cards/widgets/product_card_pricing_widget.dart';
import '../../products_cards/widgets/product_sale_tag.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key, required this.product, this.isNetworkImage = true});

  final ProductModel product;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final salePercentage = ProductController.instance.calculateSalePercentage(product.price, product.salePrice);
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),

      /// Container with side paddings, color, edges, radius and shadow.
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.lightContainer,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Thumbnail
            TRoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: isDark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// -- Thumbnail Image
                  TRoundedImage(width: 120, height: 120, imageUrl: product.thumbnail, isNetworkImage: isNetworkImage),

                  /// -- Sale Tag
                  if (salePercentage != null) ProductSaleTagWidget(salePercentage: salePercentage),

                  /// -- Favourite Icon Button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: TFavouriteIcon(productId: product.id),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            /// -- Details, Add to Cart, & Pricing
            Container(
              padding: const EdgeInsets.only(left: TSizes.sm),
              width: 172,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Details
                  Padding(
                    padding: const EdgeInsets.only(top: TSizes.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TProductTitleText(
                          title: product.title,
                          smallSize: true,
                          maxLines: 2,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems / 2),
                        TBrandTitleWithVerifiedIcon(title: product.brand!.name, brandTextSize: TextSizes.small),
                      ],
                    ),
                  ),

                  /// Price & Add to cart button
                  /// Use Spacer() to utilize all the space and set the price and cart button at the bottom.
                  /// This usually happens when Product title is in single line or 2 lines (Max)
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Pricing
                      PricingWidget(product: product),

                      /// Add to cart
                      ProductCardAddToCartButton(product: product),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
