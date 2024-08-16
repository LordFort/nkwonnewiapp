import 'package:flutter/material.dart';
import 'package:sparvoll_the_app/common/widgets/images/t_circular_images.dart';
import 'package:sparvoll_the_app/common/widgets/texts/t_brand_title_text.dart';

import '../../../features/utils/constants/colors.dart';
import '../../../features/utils/constants/sizes.dart';

// A widget that displays an image with text below it in a vertical arrangement.
class TVerticalImageAndText extends StatelessWidget {
  /// Constructor for [TVerticalImageAndText].
  const TVerticalImageAndText({
    Key? key,
    this.onTap,
    required this.image,
    required this.title,
    this.backgroundColor,
    this.isNetworkImage = true,
    this.textColor = TColors.white,
  }) : super(key: key);

  /// The image asset path or URL.
  final String image;

  /// The text to be displayed below the image.
  final String title;

  /// The color of the text.
  final Color textColor;

  /// Flag indicating whether the image is loaded from the network.
  final bool isNetworkImage;

  /// The background color of the widget.
  final Color? backgroundColor;

  /// Callback function when the widget is tapped.
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            TCircularImage(
              width: 56,
              height: 56,
              image: image,
              fit: BoxFit.fitWidth,
              padding: TSizes.sm * 1.1,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor != null? TColors.white: TColors.white
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            SizedBox(width: 65, child: TBrandTitleText(title: title, color: textColor, maxLines: 1, )),
          ],
        ),
      ),
    );
  }
}
