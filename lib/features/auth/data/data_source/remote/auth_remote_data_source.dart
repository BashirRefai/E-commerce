import 'dart:convert';

import 'package:ecommerce_f1/core/network/api.dart';
import 'package:ecommerce_f1/core/network/api_request.dart';
import 'package:ecommerce_f1/core/network/api_response.dart';
import 'package:ecommerce_f1/features/auth/data/models/params/login_params.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:ecommerce_f1/core/network/api_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRemoteDataSource {
  Future<Either<String, String>> login(String email, String password) async {
    final data = {
      'email': email,
      'password': password,
    };
    try {
      var url = Uri.parse(ApiUrls.login);
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );

      if (response.statusCode == 201) {
        print(response.body);
        var resBody = jsonDecode(response.body);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        String token = resBody['access_token'];
        await prefs.setString('token', token);
        return Right(token);
      }
      return const Right('Error');
    } catch (error) {
      return Left(error.toString());
    }
  }

  Future<Either<String, String>> loginApi(LoginParams loginParams) async {
    try {
      print(loginParams.email!.text.toString());
      final ApiRequest request = ApiRequest(
        url: ApiUrls.login,
        header: {"Content-Type": "application/json"},
        body: loginParams.toJson(),
      );
      print('object');
      final response = await Api.post(request);
      if (response.statusCode == 201) {
        print('object2');
        String token = response.body!['access_token'];
        return Right(token);
      }

      return Left('Login failed. Status: ${response.statusCode}');
    } catch (error) {
      return Left("Error: $error");
    }
  }

  Future<Either<String, String>> register(
      String name, String email, String password) async {
    final data = {
      'name': name,
      'email': email,
      'password': password,
      'avatar': "https://api.lorem.space/image/face?w=640&h=480"
    };
    try {
      var url = Uri.parse(ApiUrls.register);

      final response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(data));
      if (response.statusCode == 201) {
        var resBody = jsonDecode(response.body);
        print(resBody['name']);

        return Right(resBody['name']);
      } else {
        return const Right('error');
      }
    } catch (error) {
      return Left(error.toString());
    }
  }
}

void main() {
  // AuthRemoteDataSource remoteDataSource = AuthRemoteDataSource();
  // LoginParams loginParams = LoginParams();
  // loginParams.email!.text = 'john@mail.com';
  // loginParams.password!.text = 'changeme';
  // remoteDataSource.loginApi(loginParams);
}
