import 'package:bpdsmart_diy/routes/routes.dart';
import 'package:bpdsmart_diy/services/product_konvensional_api/konven_services.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../controllers/home_controller.dart';

class ProductKonvenView extends GetView<ProductController> {
  const ProductKonvenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Produk Konvensional',
            // style: TextStyle(color: oldLavender),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<ProductController>(
                init: ProductController(),
                builder: (_) {
                  return FutureBuilder(
                    future: KonvenService().getKonvens(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Card(
                              // color: melon,
                              margin: const EdgeInsets.all(16),
                              child: ListTile(
                                leading: snapshot.data![index].kontenId == '7'
                                    ? const Icon(FontAwesomeIcons.wallet,
                                        color: Colors.white)
                                    : snapshot.data![index].kontenId == '8'
                                        ? const Icon(
                                            FontAwesomeIcons.creditCard,
                                            color: Colors.white)
                                        : snapshot.data![index].kontenId == '9'
                                            ? const Icon(
                                                FontAwesomeIcons.servicestack,
                                                color: Colors.white)
                                            : const Icon(
                                                FontAwesomeIcons.wallet,
                                                color: Colors.white),
                                title: Text(
                                    snapshot.data![index].kontenMenu.toString(),
                                    style: TextStyle(color: Colors.white)),
                                trailing:
                                    snapshot.data![index].kontenMenu == 'Produk'
                                        ? const Text('Produk')
                                        : const Text('Menu'),
                                textColor: Colors.white,
                                onTap: () {
                                  Get.toNamed(Routes.LAYER_ONE,
                                      arguments:
                                          snapshot.data![index].kontenId);
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
                },
              ),
            ],
          ),
        ));
  }
}
