// import 'package:ecommerce_f1/features/home/presentation/pages/home.dart';
// import 'package:ecommerce_f1/features/home/presentation/pages/home_page_dara_provider.dart';
// import 'package:ecommerce_f1/features/home/presentation/pages/tell_us_about.dart';
// import 'package:ecommerce_f1/features/home/presentation/pages/splash/splash_screen.dart';
// import 'package:ecommerce_f1/features/home/presentation/pages/wish_list_detali.dart';
// import 'package:flutter/material.dart';

// enum Pages {
//   home,
//   splash,
//   tellAbout,
//   favourit,
//   ;

//   String get key => "\\$name";

//   Widget get value {
//     switch (this) {
//       case home:
//         return HomePageDaTaProvider(child: const HomePage());
//       case splash:
//         return const SplashScreen();
//       case tellAbout:
//         return const TellUsAbout();
//       case favourit:
//         return const WishListDetali();
//       default:
//         throw 'Unknow route';
//     }
//   }

//   static Map<String, Widget Function(BuildContext)> get routes {
//     Map<String, Widget Function(BuildContext)> routes = {};
//     for (var page in Pages.values) {
//       routes[page.key] = (context) => page.value;
//     }
//     routes['/'] = (context) => const SplashScreen();
//     return routes;
//   }
// }
