import 'package:flutter/material.dart';

class CustomTextFieldWidget2 extends StatelessWidget {
  //final String str;
  TextEditingController controller;

  CustomTextFieldWidget2(
      {Key? key,
      //required this.str,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: TextFormField(
        controller: controller,
        //initialValue: str,
        maxLines: 3,
        decoration: InputDecoration(
          hintText: 'Description',
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
