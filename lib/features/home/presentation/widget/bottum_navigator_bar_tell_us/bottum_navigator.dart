import 'package:ecommerce_f1/core/constants/break_points.dart';
import 'package:ecommerce_f1/core/style/app_colors.dart';
import 'package:ecommerce_f1/core/style/app_text_styles.dart';
import 'package:ecommerce_f1/features/home/presentation/widget/button_elevated.dart';
import 'package:flutter/material.dart';

class ButtonNavigator extends StatelessWidget {
  const ButtonNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColorContainer,

      // decoration: BoxDecoration(
      //     color: AppColors.backgroundColorContainer,
      //     borderRadius: BorderRadius.only(
      //       bottomRight: Radius.circular(30),
      //     )),
      height: 80,
      width: double.infinity,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 24, right: 24, top: 14, bottom: 14),
        child: ButtonElevated(
            onPressed: () {},
            size: Size(widthElevatedBig, heighElevatedBig),
            color: AppColors.primaryColor,
            child: Text(
              'Finish',
              style: AppTextStyles.white12,
            )),
      ),
    );
  }
}
