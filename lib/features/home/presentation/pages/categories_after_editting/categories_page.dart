import 'dart:developer';

import 'package:ecommerce_f1/features/home/presentation/managers/cubit/home_page_cubit.dart';
import 'package:ecommerce_f1/features/home/presentation/managers/state/home_page_state.dart';
import 'package:ecommerce_f1/features/home/presentation/managers/state/enums.dart';
import 'package:ecommerce_f1/features/home/presentation/pages/categories_after_editting/category_info.dart';
import 'package:ecommerce_f1/features/home/presentation/pages/categories_after_editting/category_item.dart';
import 'package:ecommerce_f1/features/home/presentation/widget/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext ctx) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
      child: Column(
        children: [
          SectionHeader(title: 'Categories', onSeeAllTap: () {}),
          const SizedBox(height: 10),
          SizedBox(
            height: 110,
            child: BlocBuilder<HomePageCubit, HomePageState>(
              builder: (context, state) {
                return state.isLoading == IsLoadingType.isLoadingCategories
                    ? const CircularProgressIndicator()
                    : ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 5),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.categires!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BlocProvider.value(
                                  value: BlocProvider.of<HomePageCubit>(ctx)
                                    ..getCategoryById(
                                        state.categires![index].id),
                                  child: const CategoryInfo(),
                                ),
                              ));
                            },
                            child: CategoryItem(
                              categories: state.categires![index],
                            ),
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
