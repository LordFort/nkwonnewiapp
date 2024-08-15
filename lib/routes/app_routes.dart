import 'package:get/get_navigation/src/routes/get_route.dart';
import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/onboarding/onboarding.dart';
import '../features/authentication/screens/password_configuration/forget_password.dart';
import '../features/authentication/screens/signup/signup.dart';
import '../features/authentication/screens/signup/verify_email.dart';

import '../features/personalisation/screens/Profile/widgets/profile.dart';
import '../features/personalisation/screens/address/widgets/address.dart';
import '../features/personalisation/screens/settings/settings.dart';
import '../features/shops/screens/cart/widgets/cart.dart';
import '../features/shops/screens/checkout/checkout.dart';
import '../features/shops/screens/favourites/favourite.dart';
import '../features/shops/screens/home/home.dart';
import '../features/shops/screens/orders/widgets/order.dart';
import '../features/shops/screens/product_detail/Product_reviews/widgets/product_reviews.dart';
import '../features/shops/screens/search/search.dart';
import '../features/shops/screens/store/store.dart';
import '../features/shops/screens/store/wishlist/wishlist.dart';
import 'routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    GetPage(name: TRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: TRoutes.search, page: () => SearchScreen()),
    GetPage(name: TRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: TRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingScreen()),
    // Add more GetPage entries as needed
  ];
}
