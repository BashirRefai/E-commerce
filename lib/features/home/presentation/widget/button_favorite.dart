import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonFavorite extends StatelessWidget {
  const ButtonFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 63),
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: () {},
        child: CircleAvatar(
          backgroundColor: const Color(0xFF342F3F),
          child: SvgPicture.asset(
            'assets/icons/heart.svg',
            width: 16,
            height: 16,
          ),
        ),
      ),
    );
  }
}
