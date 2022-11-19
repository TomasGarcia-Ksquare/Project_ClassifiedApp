import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:new_project/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:new_project/services/profile.dart';
import 'package:new_project/utils/alert_manager.dart';

class AuthService {
  register(context, UserModel user) async {
    var url = Uri.parse("https://adlisting.herokuapp.com/auth/register");

    ///print(url);
    var userObj = user.toJson();
    var body = jsonEncode(userObj);
    //print(body);
    try {
      var resp = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      //print(resp.body);
      Navigator.pushReplacementNamed(context, '/LoginScreen');
    } catch (e) {
      print(e);
    }
  }

  login(context, UserModel user) async {
    var storage = FlutterSecureStorage();
    var url = Uri.parse("https://adlisting.herokuapp.com/auth/login");
    //print(url);
    var userObj = user.toJson();
    try {
      var resp = await http.post(url, body: jsonEncode(userObj), headers: {
        'Content-Type': 'application/json',
      });
      var respObj = jsonDecode(resp.body);
      //print(respObj);
      if (respObj['status'] == false) {
        AlertManager().displaySnackbar(context, respObj['message']);
      }
      if (respObj['status'] == true) {
        storage.write(key: 'userId', value: respObj['data']['user']['_id']);
        storage.write(key: 'token', value: respObj['data']['token']);
        //print("Token: ${respObj['data']['token']}");
        /* storage.write(
            key: 'refreshToken', value: respObj['data']['refreshToken']); */
        Navigator.pushReplacementNamed(context, '/HomeScreen');
      }
    } catch (e) {
      print(e);
    }
  }
}
