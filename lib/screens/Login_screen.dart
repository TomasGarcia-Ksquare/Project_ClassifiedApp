import 'package:flutter/material.dart';
import 'package:new_project/widgets/CustomButton_widget.dart';
import 'package:new_project/widgets/CustomTextButton_widget.dart';
import 'package:new_project/widgets/CustomTextField_widget.dart';
import 'package:new_project/widgets/LogoImage_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            //image
            const LogoImage(),

            SizedBox(
              child: Container(
                height: 20,
              ),
            ),

            // email form
            const CustomTextFieldWidget(str: '', hint: 'Email Address'),

            const CustomTextFieldWidget(str: '', hint: 'Password'),

            //button
            const CustomButton(
              str: 'Login',
              route: '/HomeScreen',
            ),

            //text
            CustomTextButtonWidget(
              str: 'Don\'t have any account?',
              route: '/RegisterScreen',
            )
          ],
        ),
      ),
    );
  }
}
