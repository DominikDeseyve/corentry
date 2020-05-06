import 'package:corentry/logic/Controller.dart';
import 'package:corentry/widgets/UserAvatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GuestScreen extends StatefulWidget {
  _GuestScreenState createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  void initState() {
    super.initState();
    print("### INIT EXPLORE SCREEN");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Controller().theming.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Controller().theming.secondary,
          title: Row(
            children: <Widget>[
              GestureDetector(
                child: new Icon(
                  Icons.person,
                  size: 28,
                  color: Controller().theming.primary,
                ),
                onTap: () {},
              ),
              SizedBox(width: 24.0),
              Text(
                'Aktuelle Gäste',
                style: TextStyle(
                  color: Controller().theming.primary,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              color: Controller().theming.primary,
              icon: Icon(Icons.search, size: 26),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  color: Controller().theming.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.transparent),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Text(
                            '52',
                            style: TextStyle(
                              fontSize: 28,
                              color: Controller().theming.secondary,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        Text(
                          'Besucher aktuell',
                          style: TextStyle(
                            fontSize: 14,
                            color: Controller().theming.secondary,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {},
                  color: Controller().theming.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.transparent),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Text(
                            '125',
                            style: TextStyle(
                              fontSize: 28,
                              color: Controller().theming.secondary,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        Text(
                          'Besucher heute',
                          style: TextStyle(
                            fontSize: 14,
                            color: Controller().theming.secondary,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Header('Aktuell im Studio'),
          ListTile(
            onTap: () {},
            leading: UserAvatar(),
            title: Text(
              "Max Mustermann",
            ),
            subtitle: Text(
              "Biberach",
            ),
          ),
          ListTile(
            onTap: () {},
            leading: UserAvatar(),
            title: Text(
              "Max Mustermann",
            ),
            subtitle: Text(
              "Biberach",
            ),
          ),
          ListTile(
            onTap: () {},
            leading: UserAvatar(),
            title: Text(
              "Max Mustermann",
            ),
            subtitle: Text(
              "Biberach",
            ),
          ),
          ListTile(
            onTap: () {},
            leading: UserAvatar(),
            title: Text(
              "Max Mustermann",
            ),
            subtitle: Text(
              "Biberach",
            ),
          ),
          ListTile(
            onTap: () {},
            leading: UserAvatar(),
            title: Text(
              "Max Mustermann",
            ),
            subtitle: Text(
              "Biberach",
            ),
          ),
          ListTile(
            onTap: () {},
            leading: UserAvatar(),
            title: Text(
              "Max Mustermann",
            ),
            subtitle: Text(
              "Biberach",
            ),
          )
        ],
      ),
    );
  }

  void dispose() {
    super.dispose();
  }

  bool get wantKeepAlive => true;
}
