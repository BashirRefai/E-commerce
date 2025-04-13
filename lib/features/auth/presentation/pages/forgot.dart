import 'package:ecommerce_f1/core/constants/break_points.dart';
import 'package:ecommerce_f1/core/style/app_colors.dart';
import 'package:ecommerce_f1/core/style/app_text_styles.dart';
import 'package:ecommerce_f1/features/auth/presentation/pages/signin_screen.dart';
import 'package:ecommerce_f1/features/home/presentation/widget/button_elevated.dart';
import 'package:flutter/material.dart';

class Forgot extends StatelessWidget {
  const Forgot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWidget,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/Images/png/image 4.png'),
              width: 100,
              height: 100,
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Text('We Sent you an Email to reset your password.',
                  style: AppTextStyles.white24BOLD),
            ),
            const SizedBox(
              height: 24,
            ),
            ButtonElevated(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SigninScreen(),
                    ),
                  );
                },
                size: Size(widthElevatedSmall, heightElevatedSmall),
                color: AppColors.primaryColor,
                child: Text(
                  'Return to Login',
                  style: AppTextStyles.white16,
                )),
          ],
        ),
      ),
    );
  }
}
