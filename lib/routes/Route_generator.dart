import 'package:flutter/material.dart';
import 'package:new_project/models/ads.dart';
import 'package:new_project/screens/CreateAd_screen.dart';
import 'package:new_project/screens/EditAd_screen.dart';
import 'package:new_project/screens/EditProfile_screen.dart';
import 'package:new_project/screens/Home_screen.dart';
import 'package:new_project/screens/ImageViewer_screen.dart';
import 'package:new_project/screens/Login_screen.dart';
import 'package:new_project/screens/MyAds_screen.dart';
import 'package:new_project/screens/ProductDetail_screen.dart';
import 'package:new_project/screens/Register_screen.dart';
import 'package:new_project/screens/Settings_screen.dart';

class RouteGenerator {
  var generateRoute = ((settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/LoginScreen':
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case '/HomeScreen':
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case '/ProductDetailScreen':
        return MaterialPageRoute(
          builder: (context) => ProductDetailScreen(
            ads: args,
          ),
        );
      case '/RegisterScreen':
        return MaterialPageRoute(builder: (context) => RegisterScreen());
      case '/SettingsScreen':
        return MaterialPageRoute(builder: (context) => SettingsScreen());
      case '/EditProfileScreen':
        return MaterialPageRoute(builder: (context) => EditProfileScreen());
      case '/MyAdsScreen':
        return MaterialPageRoute(builder: (context) => MyAdsScreen());
      case '/ImageViewerScreen':
        return MaterialPageRoute(
          builder: (context) => ImageViewerScreen(
            images: args,
          ),
        );
      case '/EditAdScreen':
        return MaterialPageRoute(
            builder: (context) => EditAdScreen(
                  ads: args,
                ));
      case '/CreateAdScreen':
        return MaterialPageRoute(builder: (context) => CreateAdScreen());
    }
  });
}
