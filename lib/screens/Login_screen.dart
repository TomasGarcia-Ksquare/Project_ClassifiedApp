import 'package:flutter/material.dart';
import 'package:new_project/widgets/CustomButton_widget.dart';
import 'package:new_project/widgets/CustomTextButton_widget.dart';
import 'package:new_project/widgets/CustomTextField_widget.dart';
import 'package:new_project/widgets/LogoImage_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                //image
                const LogoImage(),

                SizedBox(
                  child: Container(
                    height: 20,
                  ),
                ),

                // email form
                CustomTextFieldWidget(
                    hint: 'Email Address', controller: _emailCtrl),

                CustomTextFieldWidget(
                    hint: 'Password', controller: _passwordCtrl),

                //button
                CustomButton(
                  str: 'Login',
                  //route: '/HomeScreen',
                  action: 'login',
                  email: _emailCtrl,
                  password: _passwordCtrl,
                  isLoading: false,
                ),

                //text
                CustomTextButtonWidget(
                  str: 'Don\'t have any account?',
                  route: '/RegisterScreen',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
