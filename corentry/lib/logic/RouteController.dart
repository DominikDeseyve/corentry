import 'package:corentry/pages/ActivtyScreen.dart';
import 'package:corentry/pages/WelcomeScreen.dart';
import 'package:corentry/pages/home/EntryScreen.dart';
import 'package:corentry/pages/home/HomeScreen.dart';
import 'package:corentry/pages/login/MainPage.dart';
import 'package:corentry/pages/navigation/Menu.dart';
import 'package:corentry/pages/navigation/ScanScreen.dart';
import 'package:flutter/material.dart';

class RouteController {
  static MaterialPageRoute generateRoute(RouteSettings pRouteSettings) {
    return MaterialPageRoute(
      settings: pRouteSettings,
      builder: (context) => _searchRoute(pRouteSettings),
    );
  }

  static Widget _searchRoute(RouteSettings pRouteSettings) {
    final args = pRouteSettings.arguments;
    switch (pRouteSettings.name) {

      //***************************************************//
      //*********   LOGIN
      //***************************************************//
      case '/':
        return MainPage();
        break;
      case '/root':
        return Menu();
        break;
      case '/home':
        return HomeScreen();
        break;
      case '/scan':
        return ScanScreen();
        break;
      case '/activity':
        return ActivityScreen();
        break;
      case '/entry':
        return EntryScreen();
        break;
    }
  }

  static Widget _errorRoute() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('Route not found'),
      ),
    );
  }
}

//***************************************************//
//***********   ROUTES
//***************************************************//
class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRoute({this.page})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => page,
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) => ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
          transitionDuration: Duration(milliseconds: 350),
        );
}
