import 'package:flutter/material.dart';
import 'package:new_project/widgets/CustomTextButton_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: Column(
          children: [
            ProfileSettings(),
            SettingsOption(
                icon: Icons.post_add_outlined,
                str: 'My ads',
                url: '/MyAdsScreen'),
            SettingsOption(
                icon: Icons.person_outline,
                str: 'About Us',
                webUrl: 'https://appmaking.com/about'),
            SettingsOption(
              icon: Icons.contacts_outlined,
              str: 'Contact Us',
              webUrl: 'https://appmaking.com/contact',
            )
          ],
        ),
      ),
    );
  }
}

class SettingsOption extends StatelessWidget {
  final IconData icon;
  final String str;
  final String? url;
  final String? webUrl;

  const SettingsOption(
      {Key? key, required this.icon, required this.str, this.url, this.webUrl})
      : super(key: key);

  _openURL(url) async {
    url = Uri.parse(url);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GestureDetector(
        onTap: () {
          if (url == null && webUrl != null) {
            _openURL(webUrl);
          } else {
            Navigator.pushNamed(context, url!);
          }
        },
        child: Row(
          children: [
            Container(
              width: 40,
              margin: EdgeInsets.only(right: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  icon,
                  color: Colors.grey,
                ),
              ),
            ),
            Text(str)
          ],
        ),
      ),
    );
  }
}

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                margin: EdgeInsets.only(right: 15),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://pbs.twimg.com/media/FF3ybx2XIAQFja6.jpg'),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tomas'),
                  Text('9999999999'),
                ],
              ),
            ],
          ),
          /*Text(
            'Edit',
            style: TextStyle(
              color: Color(0xfff25723),
            ),
          )*/
          CustomTextButtonWidget(route: '/EditProfileScreen', str: 'Edit')
        ],
      ),
    );
  }
}
