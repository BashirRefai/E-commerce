import 'package:ecommerce_f1/core/constants/break_points.dart';
import 'package:ecommerce_f1/core/style/app_colors.dart';
import 'package:ecommerce_f1/core/style/app_text_styles.dart';
import 'package:ecommerce_f1/features/auth/data/models/params/register_params.dart';
import 'package:ecommerce_f1/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:ecommerce_f1/features/auth/presentation/manager/state/auth_state.dart';
import 'package:ecommerce_f1/features/auth/presentation/manager/state/state.dart';
import 'package:ecommerce_f1/features/auth/presentation/pages/forgot_password.dart';
import 'package:ecommerce_f1/features/auth/presentation/pages/signin_screen.dart';
import 'package:ecommerce_f1/features/home/presentation/widget/button_arrow_left/button_arrow_left.dart';
import 'package:ecommerce_f1/features/home/presentation/widget/button_elevated.dart';
import 'package:ecommerce_f1/features/home/presentation/widget/text_form_field_widget.dart';
//import 'package:ecommerce_f1/features/home/presentation/auth/loging/singin_secand.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final RegisterParams params = RegisterParams();
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      backgroundColor: colorWidget,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ButtonArrowLeft(),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 133),
              child: Text(
                'Create Account',
                style: AppTextStyles.whit32BOLd,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23, right: 25),
              child: TextFormFieldWidget(
                controller: name,
                hintText: ' Name',
                textInputType: TextInputType.text,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23, right: 25),
              child: TextFormFieldWidget(
                  controller: email,
                  hintText: 'EmailAddress',
                  textInputType: TextInputType.emailAddress),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23, right: 25),
              child: TextFormFieldWidget(
                controller: password,
                hintText: 'Password',
                textInputType: TextInputType.visiblePassword,
                obscureText: true,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: 23, right: 25),
            //   child: TextFormFieldWidget(
            //     controller: params.avatar,
            //     hintText: 'avatar',
            //     textInputType: TextInputType.text,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                if (state.nameUser != 'error') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('is true'),
                    ),
                  );

                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SigninScreen(),
                  ));
                }
              }, builder: (context, state) {
                return ButtonElevated(
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(ctx)
                        .createUser(name.text, email.text, password.text);
                  },
                  size: Size(widthElevatedBig, heighElevatedBig),
                  color: AppColors.primaryColor,
                  child: state.isLoadingType == IsLoadingType.isLoadingRegister
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Text(
                          'Continue',
                          style: AppTextStyles.white16BOLD,
                        ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, right: 220),
              child: InkWell(
                onTap: () {
                  Navigator.of(ctx).push(
                    MaterialPageRoute(
                      builder: (context) => const ForgotPassword(),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 23),
                  child: Row(
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Text(
                        'data',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
