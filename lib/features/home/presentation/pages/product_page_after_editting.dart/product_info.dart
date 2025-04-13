import 'package:ecommerce_f1/core/constants/break_points.dart';
import 'package:ecommerce_f1/core/style/app_colors.dart';
import 'package:ecommerce_f1/core/style/app_text_styles.dart';
import 'package:ecommerce_f1/features/home/presentation/managers/cubit/home_page_cubit.dart';
import 'package:ecommerce_f1/features/home/presentation/managers/state/home_page_state.dart';
import 'package:ecommerce_f1/features/home/presentation/managers/state/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWidget,
      body: SafeArea(
        child: BlocBuilder<HomePageCubit, HomePageState>(
            builder: (context, state) {
          return state.isLoading == IsLoadingType.isLoadingProduct
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    SizedBox(
                      height: 248,
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 4),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.product?.images.length ?? 0,
                        itemBuilder: (context, index) {
                          return Image.network(
                              state.product?.images[index] ?? '',
                              height: 248,
                              width: 181);
                        },
                      ),
                    ),
                    Text(
                      '${state.product!.price}\$',
                      style: const TextStyle(
                          color: AppColors.primaryColor, fontSize: 16),
                    ),
                    Text(
                      state.product!.title,
                      style: AppTextStyles.white16BOLD,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        state.product!.description,
                        style: AppTextStyles.white16BOLD,
                      ),
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
