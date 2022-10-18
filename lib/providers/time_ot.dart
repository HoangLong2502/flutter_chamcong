import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class TimeOT with ChangeNotifier {
  final String token;
  final String api;
  final Map<String, String> header;

  TimeOT(this.token, this.api, this.header);

  List dataTimeOT = [];

  Future<void> handleCreateTimeOT(payloadData) async {
    print(payloadData);
    var url = Uri.parse(api);
    var data = json.encode(payloadData);
    try {
      var res = await http.post(url, body: data, headers: header);
      print(utf8.decode(res.bodyBytes));
    } catch (err) {
      throw err;
    }
  }
}