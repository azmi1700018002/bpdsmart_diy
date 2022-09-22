import 'package:bpdsmart_diy/models/ProdukKonven/konven.dart';
import 'package:bpdsmart_diy/services/product_konvensional_api/konven_services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  List konvenList = <Konven>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchKonvens();
    super.onInit();
  }

  void fetchKonvens() async {
    isLoading.value = true;
    final api = KonvenService().getKonvens();
    final result = await api;
    konvenList = result;
    isLoading.value = false;
    update();
  }
}
