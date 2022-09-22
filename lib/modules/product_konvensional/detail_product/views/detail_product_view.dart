import 'package:bpdsmart_diy/shared/constants/common.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_product_controller.dart';

class DetailProductView extends GetView<DetailProductController> {
  DetailProductView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(data.kontenJudul),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: data.kontenGambar == null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.network(
                              'https://via.placeholder.com/450x200.png',
                              width: 450,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.network(
                              '${baseUrl}images/${data.kontenGambar}',
                              width: 450,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    // color: melon,
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                  ),
                  child: TabBar(
                    isScrollable: true,
                    controller: controller.tabController,
                    // give the indicator a decoration (color and border radius)
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                      color: Colors.blue[900],
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(
                        text: 'Deskripsi',
                        height: 100,
                      ),
                      Tab(
                        text: 'Syarat',
                      ),
                      Tab(
                        text: 'Ketentuan',
                      ),
                      Tab(
                        text: 'Fasilitas',
                      ),
                      Tab(
                        text: 'SK',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 25.0,
                            ),
                            SizedBox(
                              width: 350,
                              child: Text(
                                data.kontenDeskripsi,
                                // style: text,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 25.0,
                            ),
                            SizedBox(
                              width: 350,
                              child: Text(
                                data.kontenSyarat ?? '',
                                // style: text,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 25.0,
                            ),
                            SizedBox(
                              width: 350,
                              child: Text(
                                data.kontenKetentuan ?? '',
                                // style: text,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 25.0,
                            ),
                            SizedBox(
                              width: 350,
                              child: Text(
                                data.kontenFasilitas ?? '',
                                // style: text,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 25.0,
                            ),
                            SizedBox(
                              width: 350,
                              child: Text(
                                data.kontenSk,
                                // style: text,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
