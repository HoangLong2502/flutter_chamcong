import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  var _token;
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
      "Content-type": "application/json",
      "Accept": "application/json"
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
        _token = json.decode(res.body)['token'];
        _account = json.decode(res.body)['data'];

        print(_account);

        // var account = utf8.decode(res.to);
        // var encoded1 = utf8.encode(account);
        // _account = utf8.decode(encoded1) as Map<String, dynamic>;
        // print(utf8.decode(encoded1));
        _isAuth = true;
      }
      notifyListeners();
    } catch (err) {
      throw (err);
    }
  }
}
