import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:new_project/models/ads.dart';
import 'package:new_project/utils/alert_manager.dart';

class AdsService {
  Future<List<AdsModel>> getAllAds() async {
    var url = Uri.parse("https://adlisting.herokuapp.com/ads");
    List<AdsModel> ads = [];
    try {
      var res = await http.get(url);
      var respJSON = jsonDecode(res.body);
      var adsData = respJSON['data'];
      ads = adsData.map<AdsModel>((ad) => AdsModel.fromJson(ad)).toList();
      return ads;
    } catch (e) {
      print(e.toString());
      return ads;
    }
  }

  Future<List<AdsModel>> fetchAds() async {
    List<AdsModel> ads = [];
    var storage = FlutterSecureStorage();
    var token = await storage.read(key: 'token');
    var url = Uri.parse('https://adlisting.herokuapp.com/ads/user');
    try {
      var resp = await http.post(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });
      var respJson = jsonDecode(resp.body);
      var adData = respJson['data'];
      print(adData);
      ads = adData.map<AdsModel>((ad) => AdsModel.fromJson(ad)).toList();
      return ads;
    } catch (e) {
      print('Error');
      return ads;
    }
  }

  updateAd(context, AdsModel ad) async {
    //print('updateAd');
    var storage = FlutterSecureStorage();
    var token = await storage.read(key: 'token');
    var url = Uri.parse("https://adlisting.herokuapp.com/ads/${ad.sId}");
    var adObj = ad.toJson();
    var body = jsonEncode(adObj);
    try {
      var resp = await http.patch(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: body,
      );
      var respObj = jsonDecode(resp.body);
      //print(respObj);
      if (respObj['status'] == false) {
        AlertManager().displaySnackbar(context, 'Fail');
      } else {
        AlertManager().displaySnackbar(context, 'Success');
        Navigator.pushReplacementNamed(context, '/MyAdsScreen');
        //Navigator.pop(context);
      }
    } catch (e) {
      print(e);
    }
  }

  createAd(context, AdsModel ad) async {
    var storage = FlutterSecureStorage();
    var url = Uri.parse("https://adlisting.herokuapp.com/ads");
    var token = await storage.read(key: 'token');
    var userObj = ad.toJson();
    var body = jsonEncode(userObj);
    try {
      var resp = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: body,
      );
      var respObj = jsonDecode(resp.body);
      if (respObj['status'] == false) {
        AlertManager().displaySnackbar(context, 'Fail');
      } else {
        AlertManager().displaySnackbar(context, 'Success');
        Navigator.pushReplacementNamed(context, '/HomeScreen');
      }
    } catch (e) {
      print(e);
    }
  }
}
