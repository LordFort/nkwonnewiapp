import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/personalisation/controllers/user_controller.dart';
import '../../../features/utils/constants/colors.dart';
import '../../../features/utils/constants/image_strings.dart';
import '../images/t_circular_images.dart';

class TUserProfileTile extends StatelessWidget {
  TUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  final controller = UserController.instance;


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isNetworkImage = controller.user.value.profilePicture.isNotEmpty;
      final image = isNetworkImage ? controller.user.value.profilePicture : TImages.user;
      return ListTile(
        leading: TCircularImage(padding: 0, image: image, width: 50, height: 50, isNetworkImage: isNetworkImage),
        title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white)),
        subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white)),
        trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: TColors.white)),
      );
    });
  }
}
