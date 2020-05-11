import 'dart:ui';
import 'package:corentry/logic/Controller.dart';
import 'package:corentry/models/Activty.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class ActivityScreen extends StatefulWidget {
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> with AutomaticKeepAliveClientMixin {
  String _lastTimelabel;
  List<Activity> _activities = [];

  void initState() {
    super.initState();
    Controller().activitiesBLOC.addListener(_updateData);
    Controller().activitiesBLOC.fetchAtivities();
  }

  void _updateData() {
    List<Activity> activites = Controller().activitiesBLOC.activities;
    setState(() {
      this._activities = activites;
    });
  }

  int _calculateDifference(DateTime pDate) {
    DateTime now = DateTime.now();
    return DateTime(pDate.year, pDate.month, pDate.day).difference(DateTime(now.year, now.month, now.day)).inDays;
  }

  Widget build(BuildContext context) {
    super.build(context);
    this._lastTimelabel = '';

    return Scaffold(
      backgroundColor: Controller().theming.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Controller().theming.secondary,
          title: Text(
            'Aktivitäten',
            style: TextStyle(
              color: Controller().theming.primary,
              fontSize: 20,
            ),
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
      body: RefreshIndicator(
        onRefresh: Controller().activitiesBLOC.fetchAtivities,
        child: ListView.builder(
          itemCount: this._activities.length,
          itemBuilder: (BuildContext context, int index) {
            int days = this._calculateDifference(this._activities[index].date);
            if (days == 0) {
              if (this._lastTimelabel != 'TODAY') {
                this._lastTimelabel = 'TODAY';
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Header('Heute'),
                    ActivityItem(this._activities[index]),
                  ],
                );
              }
            } else if (days <= -1 && days >= -7) {
              if (this._lastTimelabel != 'LAST_WEEK') {
                this._lastTimelabel = 'LAST_WEEK';
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Header('Letzte Woche'),
                    ActivityItem(this._activities[index]),
                  ],
                );
              }
            } else {
              this._lastTimelabel = 'EARLY';
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Header('Früher'),
                  ActivityItem(this._activities[index]),
                ],
              );
            }
            return ActivityItem(this._activities[index]);
          },
        ),
      ),
    );
  }

  void dispose() {
    Controller().activitiesBLOC.removeListener(_updateData);
    super.dispose();
  }

  bool get wantKeepAlive => true;
}

class Header extends StatelessWidget {
  final String _text;
  Header(this._text);
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
      child: Text(
        this._text,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Controller().theming.primary,
        ),
      ),
    );
  }
}

class ActivityItem extends StatefulWidget {
  final Activity _activity;
  ActivityItem(this._activity);
  _ActivityItemState createState() => _ActivityItemState();
}

class _ActivityItemState extends State<ActivityItem> {
  Widget build(BuildContext context) {
    return Dismissible(
      secondaryBackground: Container(
        padding: const EdgeInsets.only(right: 10),
        color: Controller().theming.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
      background: Container(color: Controller().theming.background),
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      resizeDuration: Duration(milliseconds: 100),
      movementDuration: Duration(milliseconds: 100),
      onDismissed: (DismissDirection pDirection) {
        Controller().activitiesBLOC.delete(this.widget._activity);
      },
      child: FlatButton(
        color: Colors.white,
        onPressed: () async {},
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          padding: const EdgeInsets.fromLTRB(0, 10, 15, 10),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: Container(
                  decoration: new BoxDecoration(
                    color: Controller().theming.primary,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(7),
                  child: Icon(
                    Icons.favorite_border,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        text: 'Du hast ',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                        children: [
                          TextSpan(
                              text: this.widget._activity.company.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(text: ' ' + (this.widget._activity.activityType == ActivityType.IN ? 'betreten' : 'verlassen') + '.'),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          DateFormat("EEEE").format(this.widget._activity.date.toLocal()),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Icon(
                            Icons.label_important,
                            size: 10,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          DateFormat("dd. MMMM yyyy H:mm' Uhr'").format(this.widget._activity.date.toLocal()),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              /*Container(
              width: 50,
              child: RawMaterialButton(
                onPressed: () {},
                child: Icon(
                  Icons.favorite,
                  size: 20,
                  color: materialDesign.background,
                ),
                shape: new CircleBorder(),
                fillColor: materialDesign.dark,
                padding: const EdgeInsets.all(5.0),
              ),
            ),*/
            ],
          ),
        ),
      ),
    );
  }
}
