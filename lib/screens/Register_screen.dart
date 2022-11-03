import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/widgets/CustomButton_widget.dart';
import 'package:new_project/widgets/CustomTextButton_widget.dart';
import 'package:new_project/widgets/LogoImage_widget.dart';
import 'package:new_project/widgets/CustomTextField_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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

            //txt field
            const CustomTextFieldWidget(str: '', hint: 'Full Name'),

            //txt field
            const CustomTextFieldWidget(str: '', hint: 'Email Address'),

            //txt field
            const CustomTextFieldWidget(
              str: '',
              hint: 'Mobile Number',
            ),

            //txt field
            const CustomTextFieldWidget(
              str: '',
              hint: 'Password',
            ),

            //button
            /*const CustomButton(
              str: 'Register Now',
              route: '/HomeScreen',
            ),*/
            RegisterButton(),

            //txt
            CustomTextButtonWidget(
                route: '/LoginScreen', str: 'Already have an account?')
          ],
        ),
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: SizedBox(
        width: double.infinity,
        height: 45,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/HomeScreen',
              (route) => false,
            );
          },
          child: Text('Register Now'),
        ),
      ),
    );
  }
}
