import 'package:bpdsmart_diy/routes/routes.dart';
import 'package:bpdsmart_diy/services/product_konvensional_api/deposito_konven._services.dart';
import 'package:bpdsmart_diy/services/product_konvensional_api/giro_konven_services.dart';
import 'package:bpdsmart_diy/services/product_konvensional_api/kiriman_uang_services.dart';
import 'package:bpdsmart_diy/services/product_konvensional_api/kredit_konsumer_service.dart';
import 'package:bpdsmart_diy/services/product_konvensional_api/kredit_produktif_services.dart';
import 'package:bpdsmart_diy/services/product_konvensional_api/kredit_program.dart';
import 'package:bpdsmart_diy/services/product_konvensional_api/kredit_standar_service.dart';
import 'package:bpdsmart_diy/services/product_konvensional_api/tabungan_konven_services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/layer_two_controller.dart';

class LayerTwoView extends GetView<LayerTwoController> {
  LayerTwoView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleText(data: data),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                GetBuilder<LayerTwoController>(
                  init: LayerTwoController(),
                  builder: (_) {
                    return nestedFuture();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FutureBuilder<List<Object>> nestedFuture() {
    return FutureBuilder(
      future: data.kontenId == '10'
          ? TabunganKonvenService().getTabunganKonvens()
          : data.kontenId == '11'
              ? GiroKonvenService().getKonvens()
              : data.kontenId == '12'
                  ? DepositoKonvenService().getKonvens()
                  : data.kontenId == '22'
                      ? KreditProduktifService().getKonvens()
                      : data.kontenId == '23'
                          ? KreditKonsumerService().getKonvens()
                          : data.kontenId == '25'
                              ? KreditStandarService().getKonvens()
                              : data.kontenId == '26'
                                  ? KreditProgramService().getKonvens()
                                  : data.kontenId == '39'
                                      ? KirimanUangServices().getKonvens()
                                      : TabunganKonvenService()
                                          .getTabunganKonvens(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Card(
                clipBehavior: Clip.antiAlias,
                // color: ThemeData,
                margin: const EdgeInsets.all(16),
                child: ListTile(
                  leading: data.kontenId == '10'
                      ? const Icon(FontAwesomeIcons.playstation,
                          color: Colors.white)
                      : data.kontenId == '11'
                          ? const Icon(FontAwesomeIcons.paypal,
                              color: Colors.white)
                          : data.kontenId == '12'
                              ? const Icon(FontAwesomeIcons.servicestack,
                                  color: Colors.white)
                              : const Icon(FontAwesomeIcons.wallet,
                                  color: Colors.white),
                  title: Text(
                    snapshot.data![index].kontenMenu.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: snapshot.data[index].kategoriNama == "Produk"
                      ? const Text('Produk')
                      : const Text('Menu'),
                  textColor: Colors.white,
                  onTap: () {
                    if (snapshot.data![index].kontenDeskripsi == null ||
                        snapshot.data![index].kontenDeskripsi == '' ||
                        snapshot.data![index].kontenDeskripsi == 'null') {
                      Get.snackbar(
                        'Perhatian',
                        'Belum ada konten',
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    } else if (snapshot.data![index].kategoriNama == 'Produk') {
                      Get.toNamed(
                        Routes.DETAIL_PRODUCT,
                        arguments: snapshot.data![index],
                      );
                    } else {
                      Get.toNamed(Routes.LAYER_THREE,
                          arguments: snapshot.data![index]);
                    }
                  },
                ),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    required this.data,
  }) : super(key: key);

  final data;

  @override
  Widget build(BuildContext context) {
    return Text(data.kontenId == '10'
        ? 'Tabungan Konvensional'
        : data.kontenId == '11'
            ? 'Giro Konvensional'
            : data.kontenId == '12'
                ? 'Deposito Konvensional'
                : data.kontenId == '22'
                    ? 'Kredit Produktif'
                    : data.kontenId == '23'
                        ? 'Kredit Konsumer'
                        : data.kontenId == '25'
                            ? 'Kredit Standar'
                            : data.kontenId == '26'
                                ? 'Kredit Program'
                                : data.kontenId == '39'
                                    ? 'Kiriman Uang'
                                    : 'Tabungan Konvensional');
  }
}
