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
              color: Controller().theming.fontPrimary,
              size: 26,
            ),
            title: Text(
              'Impuls Gesundheitszentrum',
              style: TextStyle(
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
              PopupMenuButton(
                padding: const EdgeInsets.all(0),
                elevation: 0,
                color: Controller().theming.background,
                icon: Icon(
                  Icons.more_vert,
                  color: Controller().theming.primary,
                ),
                onSelected: (int pValue) async {
                  switch (pValue) {
                    case 0:
                      await Controller().authentificator.signOut();
                      Navigator.of(context).pushReplacementNamed('/');
                      break;
                    case 1:
                      await Navigator.of(context, rootNavigator: true).pushNamed('/settings');
                      break;
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 0,
                    child: Text(
                      'Abmelden',
                      style: TextStyle(
                        color: Controller().theming.primary,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 1,
                    child: Text(
                      'Einstellungen',
                      style: TextStyle(
                        color: Controller().theming.primary,
                      ),
                    ),
                  ),
                ],
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
