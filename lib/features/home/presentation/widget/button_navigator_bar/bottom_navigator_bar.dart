import 'package:ecommerce_f1/features/home/presentation/managers/cubit/home_page_cubit.dart';
import 'package:ecommerce_f1/features/home/presentation/pages/home.dart';
import 'package:ecommerce_f1/features/home/presentation/pages/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonNavBar extends StatelessWidget {
  const ButtonNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 23, top: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (context) => HomePageCubit()..initHomage(),
                    child: const HomePage(),
                  ),
                ),
                (Route<dynamic> route) => false,
              );
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => const HomePage(),
              // ));
            },
            icon: SvgPicture.asset(
              'assets/icons/Vector.svg',
              width: 24,
              height: 24,
            ),
          ),
          IconButton(
            onPressed: () {
              // Navigator.pushAndRemoveUntil(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => const NotificationScreen()),
              //   (Route<dynamic> route) => false,
              // );
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => const NotificationScreen(),
              // ));
            },
            icon: SvgPicture.asset(
              'assets/icons/notifications.svg',
              width: 40,
              height: 40,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const OrdersScreen()),
                (Route<dynamic> route) => false,
              );
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => const OrdersScreen(),
              // ));
            },
            icon: SvgPicture.asset(
              'assets/icons/Vector1.svg',
              width: 24,
              height: 24,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/Vector2.svg',
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}
