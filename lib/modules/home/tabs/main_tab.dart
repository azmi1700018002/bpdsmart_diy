import 'package:bpdsmart_diy/modules/home/home.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/utils/size_config.dart';
import '../../../shared/widgets/gradient_background.dart';
import 'failure_view.dart';

class MainTab extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
            child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
              _userProfile(),
              _titleMenu(),
              _categoriesWidget1(),
              _categoriesWidget2(),
              _titleBanner(),
              Obx(() {
                if (controller.isDataProcessing.value) {
                  return Center(
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  if (controller.isDataError.value) {
                    return FailureView(onPressed: () {
                      controller.getPopular();
                    });
                  } else {
                    return CarouselSlider(
                      items: generateSlider(),
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                      ),
                    );
                  }
                }
              }),
            ]))
      ],
    );
  }

  List<Widget> generateSlider() {
    List<Widget> imageSliders = controller.lstPopular.map((item) {
      return Container(
        child: Container(
          // width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: new BoxDecoration(color: Colors.amber),
          child: GestureDetector(
            child:
                Image.network(item['image_thumbnail_path'], fit: BoxFit.fill),
            onTap: () => {
              // Get.to(() => InformasiBeritaDetail(item: item))
              Get.toNamed('/informasiberita'),
            },
          ),
          // margin: EdgeInsets.all(10.0),
          // child: ClipRRect(
          //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
          //   child: CachedNetworkImage(
          //     imageUrl: item['image_thumbnail_path'],
          //     fit: BoxFit.cover,
          //     width: Get.width,
          //     placeholder: (context, url) => Container(
          //       color: Colors.grey,
          //     ),
          //     errorWidget: (context, url, error) => Icon(
          //       Icons.error_outline,
          //       color: Colors.red,
          //     ),
          //   ),
          // ),
        ),
      );
    }).toList();
    return imageSliders;
  }
}

Widget _userProfile() {
  return Container(
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
        color: Colors.blue[900],
        // color: Colors.transparent,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        )),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/person.jpg"),
              ),
              SizedBox(width: 10.0),
              Text(
                "Selamat Datang,",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontSize: 15, color: Colors.white)),
              ),
              Text(" Jonson Suhendra",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
            ]),
            IconButton(
                icon: Icon(
                  Icons.logout,
                  size: 20,
                  color: Colors.white,
                ),
                onPressed: () {})
          ],
        ),
        SizedBox(height: 30.0),
        TextField(
          decoration: InputDecoration(
              fillColor: Colors.white,
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              suffixIcon: Icon(Icons.search),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.transparent))),
        ),
      ],
    ),
  );
}

Widget _titleMenu() {
  return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Category",
              style: GoogleFonts.asap(
                textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900]),
              ))));
}

Widget _categoriesWidget1() {
  List<Widget> list = [];
  for (int i = 0; i <= 2; i++) {
    list.add(InkWell(
        onTap: () {
          if (i == 0) {
            Get.toNamed('/product_konvensional');
          }
          if (i == 1) {
            Get.toNamed('/produksyariah');
          }
          if (i == 2) {
            Get.toNamed('/cards');
          }
        },
        child: _singleCategory1(i)));
    // list.add(SizedBox(width: MySize.size24));
  }

  // * Add Show All Categories Menu
  return Container(
    // padding: Spacing.only(top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: list,
    ),
  );
}

Widget _categoriesWidget2() {
  List<Widget> list = [];
  for (int i = 0; i <= 2; i++) {
    list.add(InkWell(onTap: () {}, child: _singleCategory2(i)));
    // list.add(SizedBox(width: MySize.size24));
  }

  // * Add Show All Categories Menu
  return Container(
    // padding: Spacing.only(top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: list,
    ),
  );
}

Widget _singleCategory1(int index) {
  List imgCategoryList1 = [
    'assets/images/categories/checklist.png',
    'assets/images/categories/checklist.png',
    'assets/images/categories/credit-card.png',
  ];
  List nameCategoryList1 = [
    'Produk Konvensional',
    'Produk Syariah ',
    'Kredit Pembiayaan',
  ];

  return Container(
    child: Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            // color: themeData.colorScheme.primary.withAlpha(20),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            imgCategoryList1[index],
            fit: BoxFit.cover,
          ),
          // padding: Spacing.all(15),
        ),
        Container(
          width: 100,
          // padding: top(8),
          child: Text(
            nameCategoryList1[index],
            maxLines: 2,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
            // style: AppTheme.getTextStyle(themeData.textTheme.caption,
            //     fontWeight: 600, letterSpacing: 0),
          ),
        )
      ],
    ),
  );
}

Widget _singleCategory2(int index) {
  List imgCategoryList2 = [
    'assets/images/categories/info.png',
    'assets/images/categories/group.png',
    'assets/images/categories/help-desk.png',
  ];
  List nameCategoryList2 = [
    'Informasi',
    'Internal',
    'Helpdesk',
  ];

  return Container(
    child: Column(
      children: <Widget>[
        SizedBox(
          height: 25,
        ),
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            imgCategoryList2[index],
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: 100,
          child: Text(
            nameCategoryList2[index],
            maxLines: 2,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
          ),
        )
      ],
    ),
  );
}

Widget _titleBanner() {
  return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Informasi & Berita",
              style: GoogleFonts.asap(
                textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900]),
              ))));
}
