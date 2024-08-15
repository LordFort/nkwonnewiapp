import 'package:get/get.dart';
import '../features/personalisation/controllers/address_controller.dart';
import '../features/shops/controllers/checkout_controller.dart';
import '../features/shops/controllers/product/images_controller.dart';
import '../features/shops/controllers/product/variation_controller.dart';
import '../features/utils/helpers/network_manager.dart';


class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    /// -- Core
    Get.put(NetworkManager());

    /// -- Product
    Get.put(CheckoutController());
    Get.put(VariationController());
    Get.put(ImagesController());

    /// -- Other
    Get.put(AddressController());

  }
}

