// import 'package:ecommerce_f1/core/style/app_colors.dart';
// import 'package:ecommerce_f1/core/style/app_text_styles.dart';
// import 'package:ecommerce_f1/features/home/data/models/product_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class WishListDetaliItem extends StatelessWidget {
//   const WishListDetaliItem({super.key, required this.p});
//   final ProductModel p;
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(16),
//       child: Column(
//         children: [
//           Stack(
//             children: [
//               Image(
//                 image: AssetImage(p.images[0]),
//                 width: double.infinity,
//                 height: 174,
//                 fit: BoxFit.scaleDown,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 141, top: 4),
//                 child: SvgPicture.asset('assets/icons/hart_blod.svg'),
//               ),
//             ],
//           ),
//           Container(
//             width: 161,
//             height: 44,
//             decoration: const BoxDecoration(
//                 color: AppColors.backgroundColorContainer,
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(10),
//                     bottomRight: Radius.circular(10))),
//             child: Padding(
//               padding: const EdgeInsets.only(left: 5),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   //Text(p.name, style: AppTextStyles.white12),
//                   const SizedBox(height: 4),
//                   //Text(p.price, style: AppTextStyles.white12BOLD),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
