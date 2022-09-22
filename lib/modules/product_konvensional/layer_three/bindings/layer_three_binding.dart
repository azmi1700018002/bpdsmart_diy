import 'package:get/get.dart';

import '../controllers/layer_three_controller.dart';

class LayerThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayerThreeController>(
      () => LayerThreeController(),
    );
  }
}
