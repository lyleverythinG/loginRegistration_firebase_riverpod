import 'package:flutter/material.dart';
import 'package:riverpod_firebase/screens/authentication/login.dart';
import 'package:riverpod_firebase/screens/authentication/register.dart';
import '../screens/home/home.dart';
import '../screens/home/homeflow.dart';
import '../screens/loading.dart';

class AppRouter {
  static Route<MaterialPageRoute> onNavigate(RouteSettings settings) {
    late final Widget selectedPage;

    switch (settings.name) {
      case LoadingScreen.route:
        selectedPage = const LoadingScreen();
        break;
      case Homepage.route:
        selectedPage = const Homepage();
        break;
      case RegisterScreen.route:
        selectedPage = RegisterScreen();
        break;
      case LoginScreen.route:
        selectedPage = LoginScreen();
        break;
      default:
        selectedPage = const HomeFlow();
        break;
    }

    return MaterialPageRoute(builder: (context) => selectedPage);
  }
}
