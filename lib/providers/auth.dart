import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  var token;
  Map<String, dynamic> _account = {};
  var _isAuth = false;
  var errLogin = '';

  dynamic get isAuth {
    if (_isAuth) {
      return true;
    }
    return false;
  }

  void setErrLogin (value) {
    errLogin = '';
  }

  get getAccount {
    return {..._account};
  }

  Future<void> login(String userName, String password, String api) async {
    final url = Uri.parse(api);
    Map<String, String> userHeader = {
      "Content-type": "application/json; charset=utf-8",
      "Accept": "application/json; charset=utf-8"
    };
    try {
      final res = await http.post(
        url,
        body: json.encode(
          {
            'username': userName,
            'password': password,
          },
        ),
        headers: userHeader,
      );
      final data = json.decode(res.body);
      if (data['detail'] == 'No such user' || data['message'] == 'Sai mat khau') {
        errLogin = 'Bạn đã điền sai tài khoản hoặc mật khẩu';
      } 
      else {
        var dataDecode = jsonDecode(utf8.decode(res.bodyBytes));
        token = dataDecode['token'];
        _account = dataDecode['data'];
        _isAuth = true;
      }
      notifyListeners();
    } catch (err) {
      throw (err);
    }
  }
}
