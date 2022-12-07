import 'package:get/get.dart';

import '../controllers/funding_controller.dart';

class FundingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FundingController>(
      () => FundingController(),
    );
  }
}
