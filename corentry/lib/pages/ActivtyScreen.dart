import 'dart:ui';
import 'package:corentry/logic/Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ActivityScreen extends StatefulWidget {
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> with AutomaticKeepAliveClientMixin {
  String _lastTimelabel;
  void initState() {
    super.initState();
    print("### INIT EXPLORE SCREEN");
  }

  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: Controller().theming.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Controller().theming.secondary,
          centerTitle: true,
          title: Text(
            'Impuls Gesundheitszentrum',
            style: TextStyle(
              fontFamily: 'Lato light',
              color: Controller().theming.primary,
              fontSize: 20,
            ),
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
      body: ListView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          this._lastTimelabel = '';
          print(this._lastTimelabel);
          int days = 0;
          if (days == 0) {
            if (this._lastTimelabel != 'TODAY') {
              this._lastTimelabel = 'TODAY';
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Header('Heute'),
                  ActivityItem(),
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
                  ActivityItem(),
                ],
              );
            }
          } else {
            this._lastTimelabel = 'EARLY';
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Header('Früher'),
                ActivityItem(),
              ],
            );
          }
          return ActivityItem();
        },
      ),
    );
  }

  void dispose() {
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
  ActivityItem();
  _ActivityItemState createState() => _ActivityItemState();
}

class _ActivityItemState extends State<ActivityItem> {
  Widget build(BuildContext context) {
    return FlatButton(
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
                            text: 'Impuls Gesundheitsuentrum ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(text: 'betreten.'),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Heute',
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
                        '12:37 Uhr',
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
    );
  }
}
