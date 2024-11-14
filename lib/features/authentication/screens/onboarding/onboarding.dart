import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sparvoll_the_app/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:sparvoll_the_app/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:sparvoll_the_app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:sparvoll_the_app/features/authentication/screens/onboarding/widgets/onboarding_skip_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/text_strings.dart';
import '../../controllers/onboarding_controller.dart';

/// Onboarding screen to introduce users to the app.
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children:  [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: AppLocalizations.of(context)!.onBoardingTitle1,
                subTitle: AppLocalizations.of(context)!.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: AppLocalizations.of(context)!.onBoardingTitle2,
                subTitle:AppLocalizations.of(context)!.onBoardingSubTitle2,
              ),
               OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: AppLocalizations.of(context)!.onBoardingTitle3,
                subTitle: AppLocalizations.of(context)!.onBoardingSubTitle3,
              )
            ],
          ),
          const OnBoardingSkipButton(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}









