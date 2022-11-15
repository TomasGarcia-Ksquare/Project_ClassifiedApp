import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_project/models/ads.dart';

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
}
