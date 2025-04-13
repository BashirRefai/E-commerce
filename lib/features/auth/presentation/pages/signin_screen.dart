import 'package:ecommerce_f1/core/constants/break_points.dart';
import 'package:ecommerce_f1/core/style/app_colors.dart';
import 'package:ecommerce_f1/core/style/app_text_styles.dart';
import 'package:ecommerce_f1/features/auth/data/models/params/login_params.dart';
import 'package:ecommerce_f1/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:ecommerce_f1/features/auth/presentation/manager/state/auth_state.dart';
import 'package:ecommerce_f1/features/auth/presentation/manager/state/state.dart';
import 'package:ecommerce_f1/features/auth/presentation/pages/signup_screen.dart';
import 'package:ecommerce_f1/features/home/presentation/managers/cubit/home_page_cubit.dart';
import 'package:ecommerce_f1/features/home/presentation/pages/home.dart';
import 'package:ecommerce_f1/features/home/presentation/widget/button_elevated.dart';
import 'package:ecommerce_f1/features/home/presentation/widget/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //LoginParams params = LoginParams();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: colorWidget,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 123, left: 27, right: 254),
                  child: Text(
                    'Sign in',
                    style: AppTextStyles.whit32BOLd,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32, left: 23, right: 24),
                  child: Column(
                    children: [
                      TextFormFieldWidget(
                        controller: emailController,
                        hintText: 'Email Address',
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty && value.contains('@')) {
                            return "Email is empty or email don't content @";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormFieldWidget(
                        controller: passwordController,
                        hintText: 'Password',
                        textInputType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "password is empty";
                          } else if (value.length < 7) {
                            return "Password must be al lest 7";
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: BlocConsumer<AuthCubit, AuthState>(
                            listener: (context, state) {
                          if (state.token != 'Error' &&
                              state.token!.isNotEmpty &&
                              _formKey.currentState!.validate()) {
                            //log(state.token!);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('login Success'),
                              ),
                            );
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) =>
                                      HomePageCubit()..initHomage(),
                                  child: const HomePage(),
                                ),
                              ),
                              (route) => false,
                            );
                          } else if (state.token == 'Error') {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('email or password not field')));
                          }
                        }, builder: (context, state) {
                          return ButtonElevated(
                            onPressed: () {
                              BlocProvider.of<AuthCubit>(context).login(
                                  emailController.text,
                                  passwordController.text);

                              //  BlocProvider.of<AuthCubit>(context).loginApi(params);
                            },
                            size: Size(widthElevatedBig, heighElevatedBig),
                            color: AppColors.primaryColor,
                            // child: Text(
                            //   'Continue',
                            //   style: AppTextStyles.white16BOLD,
                            // ),
                            child: state.isLoadingType ==
                                    IsLoadingType.isLoadingLogin
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
                        padding: const EdgeInsets.only(
                          top: 16,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => BlocProvider(
                                  create: (context) => AuthCubit(),
                                  child: const SignupScreen()),
                            ));
                          },
                          child: Row(
                            children: [
                              Text('Dont have an Account?',
                                  style: AppTextStyles.white12),
                              Text(
                                'Create One',
                                style: AppTextStyles.white12BOLD,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 71,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: ButtonElevated(
                          onPressed: () {},
                          size: Size(widthElevatedBig, heighElevatedBig),
                          color: AppColors.backgroundColorContainer,
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/Apple svg.svg',
                                width: 20,
                                height: 24.59,
                              ),
                              const SizedBox(
                                width: 59.58,
                              ),
                              const Text(
                                'Continue With Apple',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: ButtonElevated(
                          onPressed: () {},
                          size: Size(widthElevatedBig, heighElevatedBig),
                          color: AppColors.backgroundColorContainer,
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/Images/png/Google.png',
                                width: 24,
                                height: 24,
                              ),
                              const SizedBox(
                                width: 59.58,
                              ),
                              const Text(
                                'Continue With Google',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: ButtonElevated(
                          onPressed: () {},
                          size: Size(widthElevatedBig, heighElevatedBig),
                          color: AppColors.backgroundColorContainer,
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/Images/png/Facebook.png',
                                width: 24,
                                height: 24,
                              ),
                              const SizedBox(
                                width: 59.58,
                              ),
                              const Text(
                                'Continue With Facebook',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
