import 'package:ecommerce_f1/core/constants/break_points.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWidget,
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 71, left: 160, right: 170),
            child: Text(
              'Orders',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
