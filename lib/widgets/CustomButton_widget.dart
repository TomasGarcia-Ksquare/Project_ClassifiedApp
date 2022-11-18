import 'package:flutter/material.dart';
import 'package:new_project/models/ads.dart';
import 'package:new_project/models/edit_user.dart';
import 'package:new_project/models/user.dart';
import 'package:new_project/services/ads.dart';
import 'package:new_project/services/auth.dart';
import 'package:new_project/services/profile.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomButton extends StatelessWidget {
  final String str;
  final String? route;
  final String? dialNumber;
  final String action;
  TextEditingController? email;
  TextEditingController? password;
  TextEditingController? name;
  TextEditingController? mobile;
  String? imgURL;
  TextEditingController? title;
  TextEditingController? price;
  TextEditingController? description;
  String? id;
  List<String>? images;

  _openURL(url) async {
    url = Uri.parse(url);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print("Error");
    }
  }

  CustomButton({
    super.key,
    required this.str,
    this.route,
    this.dialNumber,
    required this.action,
    this.email,
    this.password,
    this.name,
    this.mobile,
    this.imgURL,
    this.title,
    this.price,
    this.description,
    this.id,
    this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: SizedBox(
        width: double.infinity,
        height: 45,
        child: ElevatedButton(
          onPressed: () {
            /*if (route == null && dialNumber != null) {
              _openURL(dialNumber);
            } else {
              Navigator.pushReplacementNamed(context, route!);
            }*/
            switch (action) {
              case 'login':
                print('login case');
                UserModel user = UserModel(
                  email: email!.text,
                  password: password!.text,
                );
                print(user.toJson());
                AuthService().login(context, user);
                break;
              case 'edit':
                print('edit case');
                EditUserModel user = EditUserModel(
                  name: name!.text,
                  email: email!.text,
                  mobile: mobile!.text,
                  imgURL: imgURL!,
                );
                ProfileService().updateUser(context, user);
                break;
              case 'editAd':
                print('editAd case');
                AdsModel ad = AdsModel(
                  sId: id,
                  title: title!.text,
                  description: description!.text,
                  price: int.parse(price!.text),
                  images: images,
                  mobile: mobile!.text,
                );
                AdsService().updateAd(context, ad);
                break;
              case 'createAd':
                print('createAd case');
                AdsModel ad = AdsModel(
                  title: title!.text,
                  description: description!.text,
                  price: int.parse(price!.text),
                  images: images,
                  mobile: mobile!.text,
                );
                AdsService().createAd(context, ad);
                break;
              default:
            }
          },
          child: Text(str),
        ),
      ),
    );
  }
}
