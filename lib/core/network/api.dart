import 'dart:convert';

import 'package:ecommerce_f1/core/network/api_request.dart';
import 'package:ecommerce_f1/core/network/api_response.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
class Api {
  static Future<ApiResponse> post(ApiRequest request) async {
    try {
      var url = Uri.parse(request.url);
      final response = await http.post(
        url,
        headers: request.header,
        body: jsonEncode(request.body), 
      );

      final decodedData = jsonDecode(response.body);

      return ApiResponse(
        statusCode: response.statusCode,
        body: decodedData,
      );
    } catch (e) {
      throw Exception("Failed to connect to server: $e");
    }
  }
}
