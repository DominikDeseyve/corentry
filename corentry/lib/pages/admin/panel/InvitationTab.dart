import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corentry/logic/Controller.dart';
import 'package:corentry/widgets/EventAvatar.dart';
import 'package:flutter/material.dart';

class InvitationTab extends StatefulWidget {
  _InvitationTabState createState() => _InvitationTabState();
}

class _InvitationTabState extends State<InvitationTab> {
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          color: Colors.white,
          margin: const EdgeInsets.only(top: 5),
          padding: const EdgeInsets.all(10),
          child: Text(
            'Hier sieht du alle Anfragen, die für dich gestellt wurden.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Controller().theming.primary,
            ),
          ),
        ),
        ListView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Header('Diese Woche'),
                InvitationItem(),
              ],
            );
          },
        )
      ],
    );
  }

  void dispose() {
    super.dispose();
  }
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

class InvitationItem extends StatelessWidget {
  InvitationItem();

  Widget _buildDialog(BuildContext dialogContext) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.delete,
            size: 45,
            color: Controller().theming.primary,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: Text(
              'Bist du dir sicher?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'Willst du die Einladung zu ',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
                children: [
                  TextSpan(
                    text: '123',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Controller().theming.primary,
                    ),
                  ),
                  TextSpan(text: ' von '),
                  TextSpan(
                    text: '1',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Controller().theming.primary,
                    ),
                  ),
                  TextSpan(text: ' wirklich ablehnen und löschen?'),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    color: Controller().theming.primary,
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                    onPressed: () {
                      Navigator.of(dialogContext).pop(null);
                    },
                    child: Text(
                      'Ja',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    color: Controller().theming.primary,
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                    },
                    child: Text(
                      'Nein',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      padding: const EdgeInsets.all(5),
      child: Stack(
        children: <Widget>[
          Positioned(
            right: 2,
            top: 2,
            child: InkWell(
              child: Icon(
                Icons.close,
                color: Colors.grey,
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext dialogContext) => this._buildDialog(dialogContext),
                );
              },
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(height: 70, child: EventAvatar()),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Dominik Deseyve',
                              style: TextStyle(fontSize: 18),
                            ),
                            Row(
                              children: <Widget>[
                                Text('Montag, 08.03.2020'),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Icon(
                                    Icons.label,
                                    size: 10,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '16:00 Uhr',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            RawMaterialButton(
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              onPressed: () {},
                              constraints: BoxConstraints(),
                              padding: EdgeInsets.fromLTRB(0, 5, 5, 5),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "Eingeladen von ",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text('1'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 7),
                          child: Icon(
                            Icons.check,
                            size: 20,
                            color: Controller().theming.primary,
                          ),
                        ),
                        Text(
                          'Zutritt erlauben',
                          style: TextStyle(
                            color: Controller().theming.primary,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 7),
                          child: Icon(
                            Icons.warning,
                            size: 20,
                            color: Controller().theming.primary,
                          ),
                        ),
                        Text(
                          'Entfernen',
                          style: TextStyle(
                            color: Controller().theming.primary,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
