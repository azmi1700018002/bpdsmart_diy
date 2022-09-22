import 'package:bpdsmart_diy/modules/auth/auth.dart';
import 'package:bpdsmart_diy/modules/home/home.dart';
import 'package:bpdsmart_diy/modules/me/cards/cards_screen.dart';
import 'package:bpdsmart_diy/modules/product_konvensional/detail_product/bindings/detail_product_binding.dart';
import 'package:bpdsmart_diy/modules/product_konvensional/detail_product/views/detail_product_view.dart';
import 'package:bpdsmart_diy/modules/product_konvensional/layer_one/bindings/layer_one_binding.dart';
import 'package:bpdsmart_diy/modules/product_konvensional/layer_one/views/layer_one_view.dart';
import 'package:bpdsmart_diy/modules/product_konvensional/layer_three/bindings/layer_three_binding.dart';
import 'package:bpdsmart_diy/modules/product_konvensional/layer_three/views/layer_three_view.dart';
import 'package:bpdsmart_diy/modules/product_konvensional/layer_two/bindings/layer_two_binding.dart';
import 'package:bpdsmart_diy/modules/product_konvensional/layer_two/views/layer_two_view.dart';
import 'package:bpdsmart_diy/modules/product_konvensional/product/bindings/home_binding.dart';
import 'package:bpdsmart_diy/modules/product_konvensional/product/views/produk_konven_view.dart';
import 'package:bpdsmart_diy/modules/splash/splash.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

// class AppPages {
//   static const INITIAL = Routes.SPLASH;

//   static final routes = [
//     GetPage(
//       name: Routes.SPLASH,
//       page: () => SplashScreen(),
//       binding: SplashBinding(),
//     ),
//     GetPage(
//       name: Routes.AUTH,
//       page: () => AuthScreen(),
//       binding: AuthBinding(),
//       children: [
//         GetPage(name: Routes.REGISTER, page: () => RegisterScreen()),
//         GetPage(name: Routes.LOGIN, page: () => LoginScreen()),
//       ],
//     ),
//     GetPage(
//         name: Routes.HOME,
//         page: () => HomeScreen(),
//         binding: HomeBinding(),
//         children: [
//           GetPage(name: Routes.CARDS, page: () => CardsScreen()),
//         ]),
//   ];
// }

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => AuthScreen(),
      binding: AuthBinding(),
      children: [
        GetPage(name: Routes.REGISTER, page: () => RegisterScreen()),
        GetPage(name: Routes.LOGIN, page: () => LoginScreen()),
      ],
    ),
    GetPage(
        name: Routes.HOME,
        page: () => HomeScreen(),
        binding: HomeBinding(),
        children: [
          GetPage(name: Routes.CARDS, page: () => CardsScreen()),
        ]),
    GetPage(
      name: _Paths.PRODUCT_KONVENSIONAL,
      page: () => const ProductKonvenView(),
      binding: ProductKonvenBinding(),
    ),
    GetPage(
      name: _Paths.LAYER_ONE,
      page: () => LayerOneView(),
      binding: LayerOneBinding(),
    ),
    GetPage(
      name: _Paths.LAYER_TWO,
      page: () => LayerTwoView(),
      binding: LayerTwoBinding(),
    ),
    GetPage(
      name: _Paths.LAYER_THREE,
      page: () => const LayerThreeView(),
      binding: LayerThreeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PRODUCT,
      page: () => DetailProductView(),
      binding: DetailProductBinding(),
    ),
  ];
}
