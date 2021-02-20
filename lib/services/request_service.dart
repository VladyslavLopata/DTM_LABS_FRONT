// import 'dart:convert';

import 'dart:convert';

import 'package:get/get.dart';

class RequestService extends GetConnect {
  final url = 'http://127.0.0.1:5000/api/';
  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future<Response> postLab1(Map<String, dynamic> body) async => post(
        url + 'lab1',
        json.encode(body),
        headers: headers,
      );

  Future<Response> postLab2(Map<String, dynamic> body) async => post(
        url + 'lab2',
        json.encode(body),
        headers: headers,
      );

  Future<Response> postLab3(Map<String, dynamic> body) async => post(
        url + 'lab3',
        json.encode(body),
        headers: headers,
      );

  Future<Response> postLab4(Map<String, dynamic> body) async => post(
        url + 'lab4',
        json.encode(body),
        headers: headers,
      );
}
