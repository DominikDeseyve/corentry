import 'package:corentry/logic/Controller.dart';
import 'package:corentry/pages/ActivtyScreen.dart';
import 'package:corentry/pages/admin/GuestScreen.dart';
import 'package:corentry/pages/admin/panel/PanelScreen.dart';
import 'package:corentry/pages/home/HomeScreen.dart';
import 'package:corentry/pages/login/LoginScreen.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.notifications_active,
                  size: 30,
                ),
              ),
            ],
            labelColor: Controller().theming.primary,
            unselectedLabelColor: Colors.grey,
            indicatorWeight: 3.5,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: Controller().theming.primary, width: 3),
              insets: EdgeInsets.fromLTRB(30, 0.0, 30, 5),
            ),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.fromLTRB(0, 0, 0, 5),
            indicatorColor: Controller().theming.primary,
          ),
        ),
        body: TabBarView(
          children: [
            HomeScreen(),
            ActivityScreen(),
          ], /*
          children: [
            GuestScreen(),
            PanelScreen(),
          ],*/
        ),
        floatingActionButton: Container(
          height: 60,
          width: 60,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: Controller().theming.primary,
              child: Icon(Icons.add),
              elevation: 2.0,
              onPressed: () async {
                await Navigator.of(context).pushNamed('/scan');
              },
            ),
          ),
        ),
      ),
    );
  }
}
