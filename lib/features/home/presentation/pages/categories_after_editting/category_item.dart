import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_f1/features/home/data/models/categories_model.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.categories});
  final CategoryModel categories;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: CachedNetworkImageProvider(categories.image),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          categories.name,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
