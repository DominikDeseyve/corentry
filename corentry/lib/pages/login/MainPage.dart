import 'package:corentry/pages/login/LoginScreen.dart';
import 'package:corentry/pages/login/RegisterScreen.dart';
import 'package:corentry/pages/login/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class MainPage extends StatefulWidget {
  final String startScreen;
  final PageController _controller = new PageController(initialPage: 1, viewportFraction: 1.0);
  MainPage({this.startScreen = ''});
  _MainScreenState createState() => new _MainScreenState();

  gotoLogin() {
    _controller.animateToPage(
      0,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }

  gotoSignup() {
    _controller.animateToPage(
      2,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }
}

class _MainScreenState extends State<MainPage> with TickerProviderStateMixin {
  void afterBuild() {
    if (this.widget.startScreen == 'LOGIN') {
      this.widget.gotoLogin();
    }
  }

  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) => this.afterBuild());
    return Container(
      height: MediaQuery.of(context).size.height,
      child: PageView(
        controller: this.widget._controller,
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          LoginScreen(),
          WelcomeScreen(this.widget),
          RegisterScreen(this.widget),
        ],
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
