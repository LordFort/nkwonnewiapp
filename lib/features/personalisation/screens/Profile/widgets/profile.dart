import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sparvoll_the_app/features/personalisation/controllers/user_controller.dart';
import 'package:sparvoll_the_app/features/personalisation/screens/Profile/widgets/profile_menu.dart';
import '../../../../../common/widgets/App_bar/appbar.dart';
import '../../../../../common/widgets/images/t_circular_images.dart';
import '../../../../../common/widgets/shimmer/shimmer.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import 'change_name.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(
                          () {
                        final networkImage = controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty ? networkImage : TImages.user;
                        return controller.imageUploading.value
                            ? const TShimmerEffect(width: 80, height: 80, radius: 80)
                            : TCircularImage(image: image, width: 80, height: 80, isNetworkImage: networkImage.isNotEmpty);
                      },
                    ),
                    TextButton(
                      onPressed: () => controller.uploadUserProfilePicture(),
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(onPressed: () => Get.to(() => const ChangeName()), title: 'Name', value: controller.user.value.fullName),
              TProfileMenu(onPressed: () {}, title: 'Username', value: controller.user.value.username),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(onPressed: () {}, title: 'User ID', value: '45689', icon: Iconsax.copy),
              TProfileMenu(onPressed: () {}, title: 'E-mail', value: controller.user.value.email),
              TProfileMenu(onPressed: () {}, title: 'Phone Number', value: controller.user.value.phoneNumber),
              TProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
              TProfileMenu(onPressed: () {}, title: 'Date of Birth', value: '1 Jan, 1900'),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              Center(
                child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: const Text('Close Account', style: TextStyle(color: Colors.red))),
              )
            ],
          ),
        ),
      ),
    );
  }}