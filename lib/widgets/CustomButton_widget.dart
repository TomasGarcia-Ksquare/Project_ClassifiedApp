import 'package:flutter/material.dart';
import 'package:new_project/models/user.dart';
import 'package:new_project/services/auth.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomButton extends StatelessWidget {
  final String str;
  final String? route;
  final String? dialNumber;
  final String action;
  TextEditingController email;
  TextEditingController password;

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
    required this.email,
    required this.password,
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
                UserModel user =
                    UserModel(email: email.text, password: password.text);
                print(user.toJson());
                AuthService().login(context, user);
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
