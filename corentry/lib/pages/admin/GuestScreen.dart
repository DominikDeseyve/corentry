import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corentry/logic/Controller.dart';
import 'package:corentry/models/User.dart';
import 'package:corentry/widgets/UserAvatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GuestScreen extends StatefulWidget {
  _GuestScreenState createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  StreamSubscription _streamSubscription;
  bool _searchMode = false;
  List<User> _user = [];

  void initState() {
    super.initState();

    this._streamSubscription = Controller().firebase.streamGuest(Controller().authentificator.user.companies[0]).listen((QuerySnapshot pQuery) {
      setState(() {
        pQuery.documentChanges.forEach((DocumentChange pChange) {
          User newUser = User.fromFirebase(pChange.document);
          switch (pChange.type) {
            case DocumentChangeType.added:
              this._user.add(newUser);
              break;
            case DocumentChangeType.modified:
              this._user[this._user.indexWhere((user) => user.userID == newUser.userID)] = newUser;
              break;
            case DocumentChangeType.removed:
              this._user.removeWhere((user) => user.userID == newUser.userID);
              break;
          }
        });
      });
    });
  }

  void _search(String pTerm) {}

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Controller().theming.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: (this._searchMode
            ? AppBar(
                backgroundColor: Controller().theming.background,
                titleSpacing: 0.0,
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, color: Controller().theming.primary),
                ),
                title: TextFormField(
                  autofocus: true,
                  onChanged: this._search,
                  decoration: InputDecoration(
                    hintText: "Suche nach Gästen,..",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Controller().theming.primary,
                    ),
                    border: InputBorder.none,
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    onPressed: () {
                      setState(() {
                        this._searchMode = false;
                      });
                    },
                    icon: Icon(
                      Icons.close,
                      color: Controller().theming.primary,
                    ),
                  ),
                ],
              )
            : AppBar(
                backgroundColor: Controller().theming.background,
                titleSpacing: 0.0,
                leading: Icon(Icons.home, color: Controller().theming.primary),
                title: FlatButton(
                  onPressed: () {
                    setState(() {
                      this._searchMode = true;
                    });
                  },
                  child: Text(
                    'Aktuelle Gäste',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      color: Controller().theming.primary,
                    ),
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    onPressed: () {
                      setState(() {
                        this._searchMode = true;
                      });
                    },
                    icon: Icon(
                      Icons.search,
                      color: Controller().theming.primary,
                    ),
                  )
                ],
              )),
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
          ListView.builder(
            shrinkWrap: true,
            itemCount: this._user.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {},
                leading: UserAvatar(),
                title: Text(
                  "Max Mustermann",
                ),
                subtitle: Text(
                  "Biberach",
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void dispose() {
    this._streamSubscription.cancel();
    super.dispose();
  }

  bool get wantKeepAlive => true;
}
