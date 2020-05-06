import 'package:corentry/logic/Controller.dart';
import 'package:corentry/widgets/EventAvatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class EntryScreen extends StatefulWidget {
  EntryScreen();

  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: EventAvatar(),
              ),
              Positioned(
                left: 10,
                top: 10,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(null);
                  },
                  child: Icon(Icons.arrow_back, size: 35, color: Colors.white),
                ),
              ),
              Positioned(
                left: 10,
                bottom: -20,
                child: Row(
                  children: <Widget>[
                    FlatButton(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Icon(
                              Icons.clear,
                              color: Controller().theming.secondary,
                              size: 20,
                            ),
                          ),
                          Text(
                            'Manuell verlassen',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 14),
                          ),
                        ],
                      ),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.only(bottomLeft: Radius.circular(20), topLeft: Radius.circular(20)),
                      ),
                      color: Controller().theming.primary,
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 10,
                bottom: -20,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: 50,
                      child: RawMaterialButton(
                        onPressed: () {},
                        child: Icon(Icons.favorite, size: 25, color: Colors.redAccent),
                        shape: new CircleBorder(),
                        fillColor: Colors.white,
                        padding: const EdgeInsets.all(10.0),
                      ),
                    ),
                    Container(
                      width: 50,
                      child: RawMaterialButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext dialogContext) => AlertDialog(
                              contentPadding: const EdgeInsets.all(0),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(
                                          Icons.event,
                                          size: 30,
                                          color: Controller().theming.primary,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                            child: Text(
                                              '123',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    height: 1,
                                  ),
                                  FlatButton(
                                    color: Colors.transparent,
                                    padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                                    onPressed: () {},
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Text(
                                          'Follower einladen',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Controller().theming.primary,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  FlatButton(
                                    color: Colors.transparent,
                                    padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                                    onPressed: () {
                                      Navigator.of(dialogContext).pop(null);
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Text(
                                          'Event teilen',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Controller().theming.primary,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  FlatButton(
                                    color: Colors.transparent,
                                    padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                                    onPressed: () {
                                      Navigator.of(dialogContext).pop(null);
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Text(
                                          'Code ansehen',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Controller().theming.primary,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.group_add,
                          size: 25,
                          color: Controller().theming.primary,
                        ),
                        shape: new CircleBorder(),
                        fillColor: Colors.white,
                        padding: const EdgeInsets.all(10.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 25, 10, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Impuls',
                      style: TextStyle(
                        fontSize: 32,
                        letterSpacing: 2,
                        color: Controller().theming.primary,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          'Gesundheitszentrum',
                          style: TextStyle(
                            fontSize: 12,
                            color: Controller().theming.primary,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 5, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.calendar_today,
                      size: 26,
                      color: Controller().theming.primary,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        ' dd. MMMM yyyy',
                        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.timer, size: 26, color: Controller().theming.primary),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 30, 0),
                      child: Text(
                        ' :mm Uhr',
                        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 5, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        '500',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        'Besucher aktuell',
                        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        '500',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        'Besucher heute',
                        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          /* Container(
            child: TabBar(
              indicatorColor: Controller().theming.primary,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.info_outline,
                          color: Controller().theming.primary,
                          size: 24,
                        ),
                      ),
                      Text(
                        "Infos",
                        style: TextStyle(
                          color: Controller().theming.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.chat_bubble,
                          color: Controller().theming.primary,
                          size: 20,
                        ),
                      ),
                      Text(
                        "Meinungen",
                        style: TextStyle(
                          color: Controller().theming.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),*/
          /*Container(
            height: 500,
            child: TabBarView(
              controller: _controller,
              children: <Widget>[
                EventInfoTab(this._event),
                EventCommentsTab(this._event),
              ],
            ),
          ),*/
        ],
      ),
    );
  }

  void dispose() {
    super.dispose();
  }
}
