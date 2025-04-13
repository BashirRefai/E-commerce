// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RegisterParams {
  final TextEditingController? name;
  final TextEditingController? email;
  final TextEditingController? password;
  final TextEditingController? avatar;
  RegisterParams({
    this.name,
    this.email,
    this.password,
    this.avatar,
  });
  toJson() {
    return {
      "name": name!.text,
      "email": email!.text,
      "password": password!.text,
      "avatar": 'https://api.lorem.space/image/face?w=640&h=480',
    };
  }
}
