import 'package:ecommerce_f1/features/auth/presentation/pages/signin_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: const Color(0xFF8E6CEF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 320,
          ),
          Image.asset('assets/Images/png/logo.png'),
          Padding(
            padding: const EdgeInsets.only(top: 205, left: 27),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SigninScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                //primary: Colors.blue,
                //onPrimary: Colors.white,
                backgroundColor: const Color(0xFF8E6CEF),
                fixedSize: const Size(344, 49),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
