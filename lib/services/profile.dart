import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:new_project/models/edit_user.dart';
import 'package:new_project/models/user.dart';

class ProfileService {
  Future<Map> fetchUser() async {
    //future builder
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

  void updateUser(contex, EditUserModel user) async {
    print('updateUser');
    var storage = FlutterSecureStorage();
    var url = Uri.parse("https://adlisting.herokuapp.com/user");
    var token = await storage.read(key: 'token');
    var userObj = user.toJson();
    var body = jsonEncode(userObj);
    try {
      var resp = await http.patch(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: body,
      );
      print(body);
      //Navigator.pushReplacementNamed(context, '/SettingsScreen');
    } catch (e) {
      print(e);
    }
  }
}

//si ya genere un token en un http request n