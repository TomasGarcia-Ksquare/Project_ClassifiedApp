import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomButton extends StatelessWidget {
  final String str;
  final String? route;
  final String? dialNumber;

  _openURL(url) async {
    url = Uri.parse(url);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print("Error");
    }
  }

  const CustomButton({
    super.key,
    required this.str,
    this.route,
    this.dialNumber,
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
            if (route == null && dialNumber != null) {
              _openURL(dialNumber);
            } else {
              Navigator.pushReplacementNamed(context, route!);
            }
          },
          child: Text(str),
        ),
      ),
    );
  }
}
