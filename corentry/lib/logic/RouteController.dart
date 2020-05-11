import 'package:corentry/logic/Controller.dart';
import 'package:corentry/pages/SettingsScreen.dart';
import 'package:corentry/pages/login/MainPage.dart';
import 'package:corentry/pages/navigation/Menu.dart';
import 'package:corentry/pages/navigation/ScanScreen.dart';
import 'package:corentry/pages/user/ActivtyScreen.dart';
import 'package:corentry/pages/user/EntryScreen.dart';
import 'package:corentry/pages/user/HomeScreen.dart';
import 'package:corentry/widgets/HugeLoader.dart';
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
        Widget page = FutureBuilder<bool>(
          future: Controller().authentificator.authentificate(),
          builder: (BuildContext context, AsyncSnapshot<bool> isAuth) {
            switch (isAuth.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.done:
                if (isAuth.data != null) {
                  if (isAuth.data) {
                    return Menu();
                  } else {
                    return MainPage();
                  }
                }

                return MainPage();
                break;
              default:
                break;
            }
            return HugeLoader.show();
          },
        );
        return page;

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
      case '/settings':
        return SettingsScreen();
        break;
      default:
        return _errorRoute();
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
