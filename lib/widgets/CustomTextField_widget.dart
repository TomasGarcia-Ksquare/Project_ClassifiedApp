import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String str;
  final String hint;

  const CustomTextFieldWidget({Key? key, required this.str, required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: TextFormField(
        initialValue: str,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: hint,
            filled: false,
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
      ),
    );
  }
}
