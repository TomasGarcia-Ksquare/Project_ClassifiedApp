import 'package:flutter/material.dart';

class CustomTextButtonWidget extends StatelessWidget {
  final String route;
  final String str;

  const CustomTextButtonWidget(
      {Key? key, required this.route, required this.str})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          route,
        );
      },
      child: Text(
        str,
        style: const TextStyle(
          color: Color(0xfff25723),
        ),
      ),
    );
  }
}
