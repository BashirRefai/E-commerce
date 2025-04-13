import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_f1/core/constants/break_points.dart';
import 'package:ecommerce_f1/features/home/data/models/categories_model.dart';
import 'package:ecommerce_f1/features/home/presentation/managers/cubit/home_page_cubit.dart';
import 'package:ecommerce_f1/features/home/presentation/managers/state/home_page_state.dart';
import 'package:ecommerce_f1/features/home/presentation/managers/state/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryInfo extends StatelessWidget {
  const CategoryInfo({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWidget,
      body:
          BlocBuilder<HomePageCubit, HomePageState>(builder: (context, state) {
        return state.isLoading == IsLoadingType.isLoadingCategory
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  CachedNetworkImage(imageUrl: state.category?.image ?? ''),
                  //Image.network(state.category?.image ?? ''),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(
                      state.category?.name ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
      }),
    );
  }
}
