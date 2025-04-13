import 'package:ecommerce_f1/core/style/app_colors.dart';
import 'package:ecommerce_f1/core/style/app_text_styles.dart';
import 'package:ecommerce_f1/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.productModel,
    required this.onProductTap,
    required this.onFavoriteTap,
  });
  final Function() onProductTap;
  final Function() onFavoriteTap;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onProductTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image.network(
                //   productModel.images[0],
                //   width: 150,
                //   height: 220,
                // ),
                Container(
                  width: 181,
                  height: 53,
                  color: AppColors.backgroundColorContainer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(productModel.title,
                          style: AppTextStyles.white12BOLD,
                          overflow: TextOverflow.clip),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const SizedBox(
                            width: 4,
                          ),
                          Text('${productModel.price}',
                              style: AppTextStyles.white12BOLD),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 141, top: 4),
              child: InkWell(
                onTap: onFavoriteTap,
                child: SvgPicture.asset('assets/icons/heart.svg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
