import 'package:ecommerce_f1/core/constants/break_points.dart';
import 'package:ecommerce_f1/core/style/app_colors.dart';
import 'package:ecommerce_f1/core/style/app_text_styles.dart';
import 'package:ecommerce_f1/features/home/presentation/widget/button_elevated.dart';
import 'package:ecommerce_f1/features/home/presentation/widget/bottum_navigator_bar_tell_us/bottum_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TellUsAbout extends StatelessWidget {
  const TellUsAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const ButtonNavigator(),
      backgroundColor: colorWidget,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 140, left: 24, right: 100),
            child: Text(
              'Tell us About yourself',
              style: AppTextStyles.white24BOLD,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 49, right: 180, left: 24),
            child: Text(
              'who do you shop for?',
              style: AppTextStyles.white16,
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonElevated(
                  onPressed: () {},
                  size: Size(widthElevatedSmall, heightElevatedSmall),
                  color: AppColors.primaryColor,
                  child: Text(
                    'Men',
                    style: AppTextStyles.white12,
                  ),
                ),
                ButtonElevated(
                  onPressed: () {},
                  size: Size(widthElevatedSmall, heightElevatedSmall),
                  color: AppColors.backgroundColorContainer,
                  child: Text(
                    'Women',
                    style: AppTextStyles.white12,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 56, right: 230, left: 24),
            child: Text(
              'How Old are you ?',
              style: AppTextStyles.white12,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 13),
            child: ButtonElevated(
              onPressed: () {},
              size: Size(widthElevatedBig, heighElevatedBig),
              color: AppColors.backgroundColorContainer,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Age Range',
                    style: AppTextStyles.white16BOLD,
                  ),
                  SvgPicture.asset('assets/icons/arrow_down.svg'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
