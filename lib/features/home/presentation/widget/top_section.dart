import 'package:ecommerce_f1/core/style/app_text_styles.dart';
import 'package:ecommerce_f1/features/home/presentation/managers/cubit/home_page_cubit.dart';
import 'package:ecommerce_f1/features/home/presentation/managers/state/home_page_state.dart';
import 'package:ecommerce_f1/features/home/presentation/managers/state/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 45, left: 24, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<HomePageCubit, HomePageState>(builder: (context, state) {
            return state.isLoading == IsLoadingType.isProfile
                ? const CircularProgressIndicator()
                : CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(state.profile?.avatar ?? ''),
                  );
          }),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF342F3F),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text(
                    'Men',
                    style: AppTextStyles.white12BOLD,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  ClipOval(
                    child: SvgPicture.asset(
                      'assets/icons/arrow_down.svg',
                      height: 6,
                      width: 6,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xFF8E6CEF),
            child: SvgPicture.asset(
              'assets/icons/bag.svg',
              height: 17,
              width: 17,
            ),
          )
        ],
      ),
    );
  }
}
