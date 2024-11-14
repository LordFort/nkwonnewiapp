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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
                    TAppBar(
                      title: Text(AppLocalizations.of(context)!.account,
                          style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white)),
                    ),

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
                    /// -- Account Settings
                     TSectionHeading(title: AppLocalizations.of(context)!.accountSettings, showActionButton: false),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    // My Addresses
                    TSettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: AppLocalizations.of(context)!.myAddresses,
                      subTitle: AppLocalizations.of(context)!.shoppingAddress,
                      onTap: () => Get.to(() => const UserAddressScreen()),
                    ),

                    // My Cart
                    TSettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: AppLocalizations.of(context)!.myCart,
                      subTitle: AppLocalizations.of(context)!.myCartSubtitle,
                      onTap: () => Get.to(() => const CartScreen()),
                    ),

                    // My Orders
                    TSettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: AppLocalizations.of(context)!.myOrders,
                      subTitle: AppLocalizations.of(context)!.ordersSubtitle,
                      onTap: () => Get.to(() => const OrderScreen()),
                    ),

                    // Bank Account
                     TSettingsMenuTile(
                        icon: Iconsax.bank,
                        title: AppLocalizations.of(context)!.bankAccount,
                        subTitle: AppLocalizations.of(context)!.bankAccountSubtitle),

                    // My Coupons
                     TSettingsMenuTile(
                        icon: Iconsax.discount_shape,
                        title: AppLocalizations.of(context)!.myCoupons,
                        subTitle: AppLocalizations.of(context)!.myCouponSubtitle),

                    // Notifications
                    TSettingsMenuTile(
                        icon: Iconsax.notification,
                        title: AppLocalizations.of(context)!.notifications,
                        subTitle: AppLocalizations.of(context)!.notificationsSubtitle,
                        onTap: () {}),

                    // Account Privacy
                     TSettingsMenuTile(
                        icon: Iconsax.security_card,
                        title: AppLocalizations.of(context)!.accountPrivacy,
                        subTitle: AppLocalizations.of(context)!.accountPrivacySubtitle),

                    /// -- App Settings
                    const SizedBox(height: TSizes.spaceBtwSections),

                     TSectionHeading(title: AppLocalizations.of(context)!.appSettings, showActionButton: false),

                    const SizedBox(height: TSizes.spaceBtwItems),

                    // Load Data
                    TSettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: AppLocalizations.of(context)!.loadData,
                      subTitle: AppLocalizations.of(context)!.loadSubtitle,
                      onTap: () => Get.to(() => const UploadDataScreen()),
                    ),

                    const SizedBox(height: TSizes.spaceBtwItems),

                    // Geolocation
                    TSettingsMenuTile(
                      icon: Iconsax.location,
                      title: AppLocalizations.of(context)!.geolocation,
                      subTitle: AppLocalizations.of(context)!.geolocationSubtitle,
                      trailing: Switch(value: true, onChanged: (value) {}),
                    ),

                    // Safe Mode
                    TSettingsMenuTile(
                      icon: Iconsax.security_user,
                      title: AppLocalizations.of(context)!.safeMode,
                      subTitle: AppLocalizations.of(context)!.safeModeSubtitle,
                      trailing: Switch(value: true, onChanged: (value) {}),
                    ),

                    // HD Image Quality
                    TSettingsMenuTile(
                      icon: Iconsax.image,
                      title: AppLocalizations.of(context)!.hdImage,
                      subTitle: AppLocalizations.of(context)!.hdImageSubtitle,
                      trailing: Switch(value: false, onChanged: (value) {}),
                    ),

                    /// -- Logout Button
                    const SizedBox(height: TSizes.spaceBtwSections),

                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => controller.logout(),
                        child: Text(AppLocalizations.of(context)!.logout),
                      ),
                    ),

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
