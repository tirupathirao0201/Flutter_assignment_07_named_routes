import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

class HttpServiceProvider extends ChangeNotifier {
  List<dynamic> dummyData = [];

  final String url =
      "https://63a5bb3df8f3f6d4abfe41ac.mockapi.io/test1/flutter-practice";

  getRequest() async {
    try {
      final Uri uri = Uri.parse(url);
      var response = await http.get(uri);
      var body = response.body;
      dummyData = jsonDecode(body);
    } on SocketException {
      print("Internet issues");
    } catch (error) {
      print("Network error ${error}");
    }
    notifyListeners();
  }
}
