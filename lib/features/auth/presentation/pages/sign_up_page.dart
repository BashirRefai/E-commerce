// main() {
// printNumber(5, (index) {
//   return null;

// });

// }

// void printNumber(int x,String? Function(int x) addOPerations) {
//   x = x + 1;
//   x = x * 2;
//   x--;

// var message=  addOPerations(x);
//   if(message!=null){
//   showMessage(message);

//   }

// }

import 'package:ecommerce_f1/features/home/presentation/widget/select_one_from_options_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String gender = '';
  String type = '';
  XFile? g;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: (){

                }, child: const Text('select image')),
                SelectOneFromOptionsWidget(
                  items: const ['female', 'male'],
                  onOptionSelected: (selectedValue) {
                    gender = selectedValue;
                    print(gender);
                  },
                ),
                SelectOneFromOptionsWidget(
                  items: const ['Salon', 'freelance'],
                  onOptionSelected: (selectedValue) {
                    type = selectedValue;
                    print(type);
                  },
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'email',
                  ),
                  validator: (value) {
                    if (!validateEmail(value ?? '')) {
                      return 'Please enter a valid phone number';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    hintText: 'phone number',
                  ),
                  validator: (value) {
                    if ((value?.length ?? 0) < 10) {
                      return 'Please enter a valid phone number ';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: 'password',
                  ),
                  validator: (value) {
                    if ((value?.length ?? 0) < 8) {
                      return 'at least 8 chars ';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: passwordConfirmController,
                  decoration: const InputDecoration(
                    hintText: 'Confiramtion password',
                  ),
                  validator: (value) {
                    if (value != passwordController.text) {
                      return 'passwords doesnt match';
                    } else {
                      return null;
                    }
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // BlocProvider.of<AuthCubit>(context).signUp();
                      print('ssss');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please enter valid data'),
                      ));
                    }
                  },
                  child: const Text('Sign Up'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateEmail(String email) {
    print(email);
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z]+-[a-zA-Z]+@[a-zA-Z]+\.(org)$',
    );
    print(emailRegex.hasMatch(email));
    return emailRegex.hasMatch(email);
  }
}
