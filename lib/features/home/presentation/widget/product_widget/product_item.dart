import 'package:cached_network_image/cached_network_image.dart';
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
                // Display the first image from the product
                CachedNetworkImage(
                  imageUrl:
                      'https://i.imgur.com/QkIa5tT_d.webp?maxwidth=760&fidelity=grand',
                  width: 180,
                  height: 219,
                  fit: BoxFit.cover,
                ),
                // Image.network(
                //   'https://i.imgur.com/QkIa5tT_d.webp?maxwidth=760&fidelity=grand',
                //   width: 180,
                //   height: 219,
                //   fit: BoxFit
                //       .cover, // Ensures the image fits nicely within the box
                // ),
                Container(
                  width: 181,
                  height: 54,
                  color: AppColors.backgroundColorContainer,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product title
                      Text(
                        productModel.title,
                        style: AppTextStyles.white12BOLD,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      // Product price
                      Row(
                        children: [
                          const SizedBox(width: 4),
                          Text(
                            '\$${productModel.price}',
                            style: AppTextStyles.white12BOLD,
                          ),
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
                child: SvgPicture.asset(
                  'assets/icons/heart.svg',
                  width: 24, // Adjust icon size if necessary
                  height: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
