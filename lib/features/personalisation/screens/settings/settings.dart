import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sparvoll_the_app/features/personalisation/screens/settings/upload_data.dart';

import '../../../../common/widgets/App_bar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/list_tiles/settings_user_tile.dart';
import '../../../../common/widgets/list_tiles/user_profile_tiles.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../home_menu.dart';
import '../../../shops/screens/cart/widgets/cart.dart';
import '../../../shops/screens/orders/widgets/order.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../controllers/user_controller.dart';
import '../Profile/widgets/profile.dart';
import '../address/widgets/address.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return PopScope(
      canPop: false,
      // Intercept the back button press and redirect to Home Screen
      onPopInvoked: (value) async => Get.offAll(const HomeMenu()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              /// -- Header
              TPrimaryHeaderContainer(
                child: Column(
                  children: [
                    /// AppBar
                    TAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white))),

                    /// User Profile Card
                    TUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
                    const SizedBox(height: TSizes.spaceBtwSections),
                  ],
                ),
              ),

              /// -- Profile Body
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// -- Account  Settings
                    const TSectionHeading(title: 'Account Settings', showActionButton: false),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    TSettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'My Addresses',
                      subTitle: 'Set shopping delivery address',
                      onTap: () => Get.to(() => const UserAddressScreen()),
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subTitle: 'Add, remove products and move to checkout',
                      onTap: () => Get.to(() => const CartScreen()),
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'My Orders',
                      subTitle: 'In-progress and Completed Orders',
                      onTap: () => Get.to(() => const OrderScreen()),
                    ),
                    const TSettingsMenuTile(
                        icon: Iconsax.bank, title: 'Bank Account', subTitle: 'Withdraw balance to registered bank account'),
                    const TSettingsMenuTile(
                        icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'List of all the discounted coupons'),
                    TSettingsMenuTile(
                        icon: Iconsax.notification, title: 'Notifications', subTitle: 'Set any kind of notification message', onTap: () {}),
                    const TSettingsMenuTile(
                        icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Manage data usage and connected accounts'),

                    /// -- App Settings
                    const SizedBox(height: TSizes.spaceBtwSections),
                    const TSectionHeading(title: 'App Settings', showActionButton: false),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    TSettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subTitle: 'Upload Data to your Cloud Firebase',
                      onTap: () => Get.to(() => const UploadDataScreen()),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    TSettingsMenuTile(
                      icon: Iconsax.location,
                      title: 'Geolocation',
                      subTitle: 'Set recommendation based on location',
                      trailing: Switch(value: true, onChanged: (value) {}),
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.security_user,
                      title: 'Safe Mode',
                      subTitle: 'Search result is safe for all ages',
                      trailing: Switch(value: false, onChanged: (value) {}),
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.image,
                      title: 'HD Image Quality',
                      subTitle: 'Set image quality to be seen',
                      trailing: Switch(value: false, onChanged: (value) {}),
                    ),

                    /// -- Logout Button
                    const SizedBox(height: TSizes.spaceBtwSections),
                    SizedBox(
                        width: double.infinity, child: OutlinedButton(onPressed: () => controller.logout(), child: const Text('Logout'))),
                    const SizedBox(height: TSizes.spaceBtwSections * 2.5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
