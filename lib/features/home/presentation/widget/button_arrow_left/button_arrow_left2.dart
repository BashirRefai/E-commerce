import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonArrowLeft2 extends StatelessWidget {
  const ButtonArrowLeft2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 63),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: CircleAvatar(
          backgroundColor: const Color(0xFF342F3F),
          child: SvgPicture.asset(
            'assets/icons/arrowleft.svg',
            width: 16,
            height: 16,
          ),
        ),
      ),
    );
  }
}
