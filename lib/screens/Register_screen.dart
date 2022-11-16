import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/models/user.dart';
import 'package:new_project/services/auth.dart';
import 'package:new_project/widgets/CustomButton_widget.dart';
import 'package:new_project/widgets/CustomTextButton_widget.dart';
import 'package:new_project/widgets/LogoImage_widget.dart';
import 'package:new_project/widgets/CustomTextField_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();
  TextEditingController _phoneCtrl = TextEditingController();

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
            CustomTextFieldWidget(hint: 'Full Name', controller: _nameCtrl),

            //txt field
            CustomTextFieldWidget(
                hint: 'Email Address', controller: _emailCtrl),

            //txt field
            CustomTextFieldWidget(
                hint: 'Mobile Number', controller: _phoneCtrl),

            //txt field
            CustomTextFieldWidget(hint: 'Password', controller: _passwordCtrl),

            //button
            /*const CustomButton(
              str: 'Register Now',
              route: '/HomeScreen',
            ),*/
            RegisterButton(
                name: _nameCtrl,
                email: _emailCtrl,
                password: _passwordCtrl,
                phone: _phoneCtrl),

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
  TextEditingController name;
  TextEditingController email;
  TextEditingController password;
  TextEditingController phone;

  RegisterButton({
    Key? key,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
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
            UserModel user = UserModel(
              name: name.text,
              email: email.text,
              password: password.text,
              mobile: phone.text,
            );
            AuthService().register(context, user);
            /*Navigator.pushNamedAndRemoveUntil(
              context,
              '/HomeScreen',
              (route) => false,
            );*/
          },
          child: Text('Register Now'),
        ),
      ),
    );
  }
}
