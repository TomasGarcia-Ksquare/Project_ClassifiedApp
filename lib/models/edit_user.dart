import 'package:get/get_connect/http/src/utils/utils.dart';

class EditUserModel {
  String? name;
  String? email;
  String? mobile;
  String? imgURL;

  EditUserModel({this.name, this.email, this.mobile, this.imgURL});

  EditUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    imgURL = json['imgURL'] ?? 'https://picsum.photos/200';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['imgURL'] = this.imgURL;
    return data;
  }
}
