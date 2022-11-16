import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ProfileService {
  Future<Map> fetchUser() async {
    var storage = FlutterSecureStorage();
    var url = Uri.parse("https://adlisting.herokuapp.com/user/profile");
    var token = await storage.read(key: 'token');
    //print(token);
    var resp = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    //print(resp.statusCode); //200 ok
    //print(resp.body);
    var respJson = jsonDecode(resp.body);
    //print(respJson);
    var userData = respJson['data'];
    //Map user = userData;
    //print('userData:');
    //print(userData);
    return userData;
  }
}
