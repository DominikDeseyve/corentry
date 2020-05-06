import 'package:corentry/logic/Controller.dart';
import 'package:corentry/pages/admin/panel/EntryTab.dart';
import 'package:corentry/pages/admin/panel/InvitationTab.dart';
import 'package:flutter/material.dart';

class PanelScreen extends StatefulWidget {
  _PanelScreenState createState() => _PanelScreenState();
}

class _PanelScreenState extends State<PanelScreen> {
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: Controller().theming.secondary,
            leading: Icon(
              Icons.notifications_active,
              color: Controller().theming.primary,
              size: 26,
            ),
            title: Text(
              'Impuls Gesundheitszentrum',
              style: TextStyle(
                fontFamily: 'Lato light',
                color: Controller().theming.primary,
                fontSize: 20,
              ),
            ),
            bottom: TabBar(
              indicatorColor: Controller().theming.primary,
              labelColor: Controller().theming.primary,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Mein Entry',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Anfragen',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              IconButton(
                color: Controller().theming.primary,
                icon: Icon(Icons.settings, size: 26),
                onPressed: () {},
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            EntryTab(),
            InvitationTab(),
          ],
        ),
      ),
    );
  }

  void dispose() {
    super.dispose();
  }
}
