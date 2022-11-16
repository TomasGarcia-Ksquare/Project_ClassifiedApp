import 'package:flutter/material.dart';
import 'package:new_project/widgets/CustomButton_widget.dart';
import 'package:new_project/widgets/CustomTextButton_widget.dart';
import 'package:new_project/widgets/CustomTextField_widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.center,
            child: Text("Edit Profile"),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                height: 60,
                width: 60,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://pbs.twimg.com/media/FF3ybx2XIAQFja6.jpg'),
                ),
              ),
            ),
            /*CustomTextFieldWidget(str: 'Tomas', hint: ''),
            CustomTextFieldWidget(str: 'tomas@mail.com', hint: ''),
            CustomTextFieldWidget(str: '+529999999999', hint: ''),*/
            //CustomButton(str: 'Update Profile', route: '/SettingsScreen'),
            SizedBox(
              child: Container(
                height: 20,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/LoginScreen', (route) => false);
              },
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Color(0xfff25723),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
