import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common/widgets/App_bar/appbar.dart';
import '../../../../../common/widgets/products/carts/products_cart_and_cards/cart_menu_icon.dart';
import '../../../../../common/widgets/shimmer/shimmer.dart';
import '../../../../personalisation/controllers/user_controller.dart';
import '../../../../personalisation/screens/Profile/widgets/profile.dart';
import '../../../../utils/constants/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());

    return TAppBar(
      title: GestureDetector(
        onTap: () => Get.to(() => const ProfileScreen()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.homeAppbarTitle, // Use the localized string
              style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey),
            ),
            Obx(
                  () {
                // Check if user Profile is still loading
                if (userController.profileLoading.value) {
                  // Display a shimmer loader while user profile is being loaded
                  return const TShimmerEffect(width: 80, height: 15);
                } else {
                  // Check if there are no record found
                  if (userController.user.value.id.isEmpty) {
                    // Display a message when no data is found
                    return Text(
                      'Your Name',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: TColors.white),
                    );
                  } else {
                    // Display User Name
                    return Text(
                      userController.user.value.fullName,
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: TColors.white),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
      actions: const [
        TCartCounterIcon(iconColor: TColors.white,
            counterBgColor: TColors.black,
            counterTextColor: TColors.white)
      ],
    );
  }
}

