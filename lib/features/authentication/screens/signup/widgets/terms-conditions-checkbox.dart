import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/sign_up/signup_controller.dart';

class TTermsandConditionCheckbox extends StatelessWidget {
  const TTermsandConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Row(
      children: [
        /// CHECKBOX => Wrap in a Sized box to remove extra padding
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
                () => Checkbox(value: controller.privacyPolicy.value, onChanged: (value) => controller.privacyPolicy.value = value!),
          ),
        ),
        const SizedBox(width: TSizes.md),
        Flexible(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: '${AppLocalizations.of(context)!.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: AppLocalizations.of(context)!.privacyPolicy,
                  recognizer: TapGestureRecognizer()..onTap = () => TDeviceUtils.launchWebsiteUrl('https://www.sparvoll.de/widgets/cms/8e8a30b770df4ff6ba83246a076a133a'),
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.primary,
                  ),
                ),
                TextSpan(text: ' ${AppLocalizations.of(context)!.and} ', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: AppLocalizations.of(context)!.termsOfUse,
                  recognizer: TapGestureRecognizer()..onTap = () => TDeviceUtils.launchWebsiteUrl('https://www.sparvoll.de/widgets/cms/093324191c1c4b9fb8fb345f621683d3'),
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
