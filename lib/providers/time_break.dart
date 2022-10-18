import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TimeBreaks with ChangeNotifier {
  final String token;
  final String api;
  final Map<String, String> header;

  TimeBreaks(this.token, this.api, this.header);

  List timeBreaks = [];

  Future<void> handleCreateTimeBreak() async {
    var url = Uri.parse(api);
    var data = json.encode({
      
    });
    try {
      http.post(
        url,
        body: data,
        headers: header,
      );
    } catch (err) {}
  }
}
