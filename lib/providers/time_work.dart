import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:bcrypt/bcrypt.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class TimeWork with ChangeNotifier {
  Future<Map> HandleCreateTimeWork(
    XFile image,
    double lat,
    double lng,
    String type,
    String api,
    Map<String, String> headers,
  ) async {
    // secret key to checkin
    final String keyHash = 'idtinc' +
        DateTime.now().day.toString() +
        (DateTime.now().month).toString();

    final String hash = BCrypt.hashpw(keyHash, BCrypt.gensalt(logRounds: 10));

    // create method post
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(api),
    );
    request.fields["lat"] = lat.toString();
    request.fields["lng"] = lng.toString();
    request.fields["type"] = type;
    request.fields["key"] = hash;

    //add header
    request.headers.addAll(headers);

    //add image file
    var pic = await http.MultipartFile.fromPath("image", image.path);
    request.files.add(pic);

    //post and wait response
    try {
      var response = await request.send();
      final respStr = await response.stream.bytesToString();
      return Future.value(json.decode(respStr));
    } catch (err) {
      throw err;
    }
  }
}
