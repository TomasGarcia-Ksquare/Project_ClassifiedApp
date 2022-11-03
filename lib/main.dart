import 'package:flutter/material.dart';
import 'package:new_project/routes/Route_generator.dart';
import 'package:new_project/screens/Home_screen.dart';
import 'package:new_project/screens/Login_Screen.dart';
import 'package:new_project/screens/ProductDetail_screen.dart';
import 'package:new_project/screens/Register_screen.dart';
import 'package:new_project/screens/Settings_screen.dart';
import 'package:new_project/styles/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme().theme,
      initialRoute: '/LoginScreen',
      onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}
