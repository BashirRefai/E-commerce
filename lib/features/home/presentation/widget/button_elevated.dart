import 'package:flutter/material.dart';

class ButtonElevated extends StatelessWidget {
  const ButtonElevated({
    super.key,
    
    required this.onPressed,
    required this.size,
    required this.color,
    required this.child,
  });
  final Function() onPressed;
  final Widget child;
  final Size size;
  final Color color;
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        fixedSize: size,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
