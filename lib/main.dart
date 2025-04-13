import 'package:ecommerce_f1/core/routes/routes.dart';
import 'package:ecommerce_f1/features/auth/presentation/pages/sign_up_page.dart';
import 'package:ecommerce_f1/features/home/presentation/managers/cubit/home_page_cubit.dart';
import 'package:ecommerce_f1/features/home/presentation/pages/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // home: const NavigationExample(),
      //home: SplashScreen(),
      // routes: {
      //   Pages.home.key : (context)=>Pages.home.value,
      //   Pages.location_picker.key : (context)=>Pages.location_picker.value,
      // },

      // initialRoute: Pages.home.key,
      // routes: Pages.routes,

      // home: BlocProvider(
      //   create: (context) => HomePageCubit()..initHomage(),
      //   child: const HomePage(),
      // ),

      home: SignUpPage(),
    );
  }
}
