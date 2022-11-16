import 'package:flutter/material.dart';
import 'package:new_project/widgets/CustomButton_widget.dart';
import 'package:new_project/widgets/CustomTextField2_widget.dart';
import 'package:new_project/widgets/CustomTextField_widget.dart';
import '../widgets/NewPhoto_widget.dart';

class CreateAdScreen extends StatelessWidget {
  const CreateAdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.center,
            child: Text('Create Ad'),
          ),
        ),
        body: Column(
          children: [
            NewPhotoWidget(),
            /*CustomTextFieldWidget(str: '', hint: 'Title'),
            CustomTextFieldWidget(str: '', hint: 'Price'),
            CustomTextFieldWidget(str: '', hint: 'Contact Number'),*/
            CustomTextFieldWidget2(str: ''),
            SizedBox(
              height: 20,
            ),
            /*CustomButton(
              str: 'Submit Ad',
              route: '/MyAdsScreen',
            )*/
          ],
        ),
      ),
    );
  }
}
