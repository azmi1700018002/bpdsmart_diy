import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class ProductKonvenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(
      () => ProductController(),
    );
    // List<Bind> dependencies() {
    //   return [
    //     Bind.lazyPut<ProductController>(
    //       () => ProductController(),
    //     )
    // ];
  }
}
