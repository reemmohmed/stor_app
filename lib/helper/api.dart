import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String uri, @required String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token ',
      });
    }

    http.Response response = await http.get(Uri.parse(uri), headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('there is a problem statuecode${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token ',
      });
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'there ia a problem${response.statusCode} with ${response.body}');
    }
  }

  Future<Map<String, dynamic>> put({
    required String url,
    required Map<String, dynamic>
        body, // تأكد من أن البيانات هي Map<String, dynamic>
    required String? token,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': 'application/json', // تأكد من استخدام نوع المحتوى الصحيح
    });

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    print('url $url body $body token $token');
    http.Response response = await http.put(Uri.parse(url),
        body: jsonEncode(body), headers: headers);

    if (response.statusCode == 200) {
      // تأكد من أن البيانات التي يتم استلامها هي Map<String, dynamic>
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }

  // Future<dynamic> put(
  //     {required String url,
  //     @required dynamic body,
  //     @required String? token}) async {
  //   Map<String, String> headers = {};
  //   headers.addAll({
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //   });
  //   if (token != null) {
  //     headers.addAll({'Authorization': 'Bearer $token '});
  //   }
  //   print('url $url body $body token $token ');
  //   http.Response response =
  //       await http.put(Uri.parse(url), body: body, headers: headers);
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> data = jsonDecode(response.body);
  //     print(data);
  //     return data;
  //   } else {
  //     throw Exception(
  //         'there ia a problem${response.statusCode} with ${response.body}');
  //   }
  // }
}
