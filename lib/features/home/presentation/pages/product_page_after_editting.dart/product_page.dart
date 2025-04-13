import 'package:ecommerce_f1/features/home/presentation/managers/cubit/home_page_cubit.dart';
import 'package:ecommerce_f1/features/home/presentation/managers/state/home_page_state.dart';
import 'package:ecommerce_f1/features/home/presentation/managers/state/enums.dart';
import 'package:ecommerce_f1/features/home/presentation/pages/product_page_after_editting.dart/product_info.dart';
import 'package:ecommerce_f1/features/home/presentation/widget/product_widget/product_item.dart';
import 'package:ecommerce_f1/features/home/presentation/widget/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
          child: SectionHeader(title: 'Top Selling', onSeeAllTap: () {}),
        ),
        SizedBox(
          height: 281,
          child: BlocBuilder<HomePageCubit, HomePageState>(
              builder: (context, state) {
            return state.isLoading == IsLoadingType.isLoadingProducts
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.products?.length ?? 0,
                    itemBuilder: (context, index) {
                      return ProductItem(
                          productModel: state.products![index],
                          onProductTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                  value: BlocProvider.of<HomePageCubit>(context)
                                    ..getProductById(state.products![index].id),
                                  child: const ProductInfo(),
                                ),
                              ),
                            );
                          },
                          onFavoriteTap: () {});
                    },
                  );
          }),
        ),
      ],
    );
  }
}
