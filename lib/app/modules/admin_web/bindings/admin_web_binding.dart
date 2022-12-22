import 'package:get/get.dart';

import '../controllers/admin_web_controller.dart';

class AdminWebBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminWebController>(
      () => AdminWebController(),
    );
  }
}
