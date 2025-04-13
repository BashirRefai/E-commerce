import 'dart:developer';

import 'package:ecommerce_f1/core/constants/break_points.dart';
import 'package:ecommerce_f1/core/cubit/product_item_cubit.dart';
import 'package:ecommerce_f1/features/home/presentation/managers/cubit/home_page_cubit.dart';
import 'package:ecommerce_f1/features/home/presentation/managers/state/home_page_state.dart';
import 'package:ecommerce_f1/features/home/presentation/pages/categories_after_editting/categories_page.dart';
import 'package:ecommerce_f1/features/home/presentation/pages/product_page_after_editting.dart/product_page.dart';
import 'package:ecommerce_f1/features/home/presentation/widget/button_navigator_bar/bottom_navigator_bar.dart';
import 'package:ecommerce_f1/features/home/presentation/pages/search.dart';
import 'package:ecommerce_f1/features/home/presentation/widget/top_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorWidget,
        bottomNavigationBar: const ButtonNavBar(),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              TopSection(),
              Search(),
              // BlocBuilder<HomePageCubit, HomePageState>(
              //     builder: (context, state) {
              //   //log('${state.categires!.length}');
              //   return state.isLoadingCategories == true
              //       ? const Center(
              //           child: CircularProgressIndicator(),
              //         )
              //       : Categories(
              //           model: state.categires!,
              //           //onTapCategories: (index) {},
              //         );
              // }),

              // BlocBuilder<HomePageCubit, HomePageState>(
              //     builder: (context, state) {
              //   return state.isLoadingProducts == true
              //       ? const Center(
              //           child: CircularProgressIndicator(),
              //         )
              //       : ProductScreen(
              //           products: state.products!,
              //         );
              // }),
               CategoriesPage(),
              ProductPage(),
              // ProductScreen(products: products),
            ],
          ),
        ),
      ),
    );
  }
}
