import 'package:flutter/material.dart';
import 'package:new_project/services/profile.dart';
import 'package:new_project/widgets/CustomButton_widget.dart';
import 'package:new_project/widgets/CustomTextButton_widget.dart';
import 'package:new_project/widgets/CustomTextField_widget.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  //TextEditingController _emailCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: ProfileService().fetchUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map user = snapshot.data!;
            TextEditingController _nameCtrl =
                TextEditingController(text: user['name']);
            TextEditingController _emailCtrl =
                TextEditingController(text: user['email']);
            TextEditingController _mobileCtrl =
                TextEditingController(text: user['mobile']);
            return Scaffold(
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
                        backgroundImage: NetworkImage(user['imgURL']),
                      ),
                    ),
                  ),
                  CustomTextFieldWidget(
                      hint: _nameCtrl.text, controller: _nameCtrl),
                  CustomTextFieldWidget(
                      hint: _emailCtrl.text, controller: _emailCtrl),
                  CustomTextFieldWidget(
                      hint: _mobileCtrl.text, controller: _mobileCtrl),
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
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
