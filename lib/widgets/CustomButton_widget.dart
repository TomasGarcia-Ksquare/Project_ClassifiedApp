import 'package:flutter/material.dart';
import 'package:new_project/models/ads.dart';
import 'package:new_project/models/edit_user.dart';
import 'package:new_project/models/user.dart';
import 'package:new_project/services/ads.dart';
import 'package:new_project/services/auth.dart';
import 'package:new_project/services/profile.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomButton extends StatefulWidget {
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
  bool? isLoading;

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
    this.isLoading = false,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  _openURL(url) async {
    url = Uri.parse(url);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print("Error");
    }
  }

  waitForResp(caseIndex, data) async {
    switch (caseIndex) {
      case 'login':
        await AuthService().login(context, data);
        setState(() {
          widget.isLoading = false;
        });
        break;
      case 'register':
        await AuthService().register(context, data);
        setState(() {
          widget.isLoading = false;
        });
        break;
      case 'editProfile':
        await ProfileService().updateUser(context, data);
        setState(() {
          widget.isLoading = false;
        });
        break;
      case 'editAd':
        await AdsService().updateAd(context, data);
        setState(() {
          widget.isLoading = false;
        });
        break;
      case 'createAd':
        await AdsService().createAd(context, data);
        setState(() {
          widget.isLoading = false;
        });
        break;
      default:
    }
  }

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
            setState(() {
              widget.isLoading = true;
            });
            switch (widget.action) {
              case 'login':
                //print('login case');
                UserModel user = UserModel(
                  email: widget.email!.text,
                  password: widget.password!.text,
                );
                //print(user.toJson());
                //AuthService().login(context, user);
                waitForResp(widget.action, user);
                break;
              case 'editProfile':
                //print('edit case');
                EditUserModel user = EditUserModel(
                  name: widget.name!.text,
                  email: widget.email!.text,
                  mobile: widget.mobile!.text,
                  imgURL: widget.imgURL!,
                );
                //ProfileService().updateUser(context, user);
                waitForResp(widget.action, user);
                break;
              case 'editAd':
                //print('editAd case');
                AdsModel ad = AdsModel(
                  sId: widget.id,
                  title: widget.title!.text,
                  description: widget.description!.text,
                  price: int.parse(widget.price!.text),
                  images: widget.images,
                  mobile: widget.mobile!.text,
                );
                //AdsService().updateAd(context, ad);
                waitForResp(widget.action, ad);
                break;
              case 'createAd':
                //print('createAd case');
                AdsModel ad = AdsModel(
                  title: widget.title!.text,
                  description: widget.description!.text,
                  price: int.parse(widget.price!.text),
                  images: widget.images,
                  mobile: widget.mobile!.text,
                );
                //AdsService().createAd(context, ad);
                waitForResp(widget.action, ad);
                break;
              case 'register':
                UserModel user = UserModel(
                  name: widget.name!.text,
                  email: widget.email!.text,
                  password: widget.password!.text,
                  mobile: widget.mobile!.text,
                );
                waitForResp(widget.action, user);
                break;
              case 'dialNumber':
                _openURL(widget.dialNumber);
                print('1 ${widget.dialNumber}');
                break;
              default:
            }
          },
          child: widget.isLoading!
              ? CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(widget.str),
        ),
      ),
    );
  }
}
