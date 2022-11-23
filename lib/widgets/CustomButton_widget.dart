import 'package:flutter/material.dart';
import 'package:new_project/models/ads.dart';
import 'package:new_project/models/edit_user.dart';
import 'package:new_project/models/user.dart';
import 'package:new_project/services/ads.dart';
import 'package:new_project/services/auth.dart';
import 'package:new_project/services/profile.dart';
import 'package:new_project/utils/alert_manager.dart';
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
      // ignore: avoid_print
      print("Error");
    }
  }

  buttonCase(caseIndex) async {
    switch (caseIndex) {
      case 'login':
        UserModel user = UserModel(
          email: widget.email!.text,
          password: widget.password!.text,
        );
        await AuthService().login(context, user);
        setState(() {
          widget.isLoading = false;
        });
        break;
      case 'register':
        UserModel user = UserModel(
          name: widget.name!.text,
          email: widget.email!.text,
          password: widget.password!.text,
          mobile: widget.mobile!.text,
        );
        if (user.name!.isEmpty ||
            user.email!.isEmpty ||
            user.mobile!.isEmpty ||
            user.password!.isEmpty) {
          AlertManager().displaySnackbar(context, 'Fail');
          setState(() {
            widget.isLoading = false;
          });
        } else {
          await AuthService().register(context, user);
          setState(() {
            widget.isLoading = false;
          });
        }
        break;
      case 'editProfile':
        EditUserModel user = EditUserModel(
          name: widget.name!.text,
          email: widget.email!.text,
          mobile: widget.mobile!.text,
          imgURL: widget.imgURL!,
        );
        if (user.email!.isEmpty) {
          AlertManager().displaySnackbar(context, 'Fail');
          setState(() {
            widget.isLoading = false;
          });
        } else {
          await ProfileService().updateUser(context, user);
          setState(() {
            widget.isLoading = false;
          });
        }
        break;
      case 'editAd':
        AdsModel ad = AdsModel(
          sId: widget.id,
          title: widget.title!.text,
          description: widget.description!.text,
          price: int.parse(widget.price!.text),
          images: widget.images,
          mobile: widget.mobile!.text,
        );
        await AdsService().updateAd(context, ad);
        setState(() {
          widget.isLoading = false;
        });
        break;
      case 'createAd':
        AdsModel ad = AdsModel(
          title: widget.title!.text,
          description: widget.description!.text,
          price: int.parse(widget.price!.text),
          images: widget.images,
          mobile: widget.mobile!.text,
        );
        await AdsService().createAd(context, ad);
        setState(() {
          widget.isLoading = false;
        });
        break;
      case 'dialNumber':
        _openURL(widget.dialNumber);
        print('1 ${widget.dialNumber}');
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
            setState(() {
              widget.isLoading = true;
            });
            buttonCase(widget.action);
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
