import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(
              dark ? TImages.nkwoAppLogo : TImages.nkwoAppLogo),
        ),

        Text(
          AppLocalizations.of(context)!.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Divider(
          color: dark ? TColors.darkGrey : TColors.grey,
          thickness: 1,
          indent: 1,
          endIndent: 5,
        ),
        const SizedBox(height: TSizes.sm),
        Text(
          AppLocalizations.of(context)!.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
