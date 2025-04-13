import 'package:ecommerce_f1/core/constants/break_points.dart';
import 'package:ecommerce_f1/core/style/app_colors.dart';
import 'package:ecommerce_f1/core/style/app_text_styles.dart';
import 'package:ecommerce_f1/features/auth/presentation/pages/forgot.dart';
import 'package:ecommerce_f1/features/home/presentation/widget/button_arrow_left/button_arrow_left.dart';
import 'package:ecommerce_f1/features/home/presentation/widget/button_elevated.dart';
import 'package:ecommerce_f1/features/home/presentation/widget/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWidget,
      body: Column(
        children: [
          const ButtonArrowLeft(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 120),
            child: Text('Forgot Password', style: AppTextStyles.whit32BOLd),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35, left: 23, right: 24),
            child: Column(
              children: [
                const TextFormFieldWidget(
                    hintText: 'Enter Email address',
                    textInputType: TextInputType.emailAddress),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: ButtonElevated(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Forgot(),
                      ));
                    },
                    size: Size(widthElevatedBig, heighElevatedBig),
                    color: AppColors.primaryColor,
                    child: Text(
                      'Continue',
                      style: AppTextStyles.white16BOLD,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
