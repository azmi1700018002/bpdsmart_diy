import 'package:get/get.dart';

import '../controllers/layer_one_controller.dart';

class LayerOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayerOneController>(
      () => LayerOneController(),
    );
  }
}
