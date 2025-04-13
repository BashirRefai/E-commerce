import 'package:ecommerce_f1/core/constants/break_points.dart';
import 'package:ecommerce_f1/features/home/presentation/widget/order_item.dart';
import 'package:ecommerce_f1/features/home/presentation/widget/button_navigator_bar/bottom_navigator_bar.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const ButtonNavBar(),
      backgroundColor: colorWidget,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 71, left: 160, right: 170),
            child: Text(
              'Orders',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200, left: 140, right: 140),
            child: Image.asset('assets/Images/png/check-out 1.png'),
          ),
          const Text(
            'No Orders yet',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 24,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const OrderItem(),
              ));
            },
            style: ElevatedButton.styleFrom(
              //primary: Colors.blue, // Background color
              //onPrimary: Colors.white, // Text color
              backgroundColor: const Color(0xFF8E6CEF),
              fixedSize: const Size(185, 52),
            ),
            child: const Text(
              'Explore Categories',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
