import 'package:flutter/material.dart';
import 'package:sparvoll_the_app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:sparvoll_the_app/features/authentication/screens/login/widgets/login_header.dart';
import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              TLoginHeader(dark: dark),
              const TLoginForm(),
               const TFormDivider( dividerText: '',),
          const SizedBox(height: TSizes.spaceBtwSections),
          const TSocialButtons(),
       ],
    ),
      ),
      ),
    );
  }
}







