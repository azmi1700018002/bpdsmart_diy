import 'package:get/get.dart';

import '../controllers/layer_two_controller.dart';

class LayerTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayerTwoController>(
      () => LayerTwoController(),
    );
  }
}
