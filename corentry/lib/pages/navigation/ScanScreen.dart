import 'package:barcode_scan/barcode_scan.dart';
import 'package:corentry/logic/Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScanScreen extends StatefulWidget {
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  void initState() {
    super.initState();

    this.scan();
  }

  Future scan() async {
    String qrCode;
    try {
      //qrCode = await BarcodeScanner.scan();
      qrCode = '123';
      //Controller().theming.showSnackbar(context, qrCode);
      print(qrCode);
      Controller().firebase.runScan(qrCode, Controller().authentificator.user.userID);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        qrCode = 'The user did not grant the camera permission!';
      } else {
        qrCode = 'Unknown error: $e';
      }
    } on FormatException {} catch (e) {
      qrCode = 'Unknown error: $e';
    }
    // Navigator.of(context).pop();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }

  void dispose() {
    super.dispose();
  }
}

class EventFeedItem extends StatefulWidget {
  EventFeedItem();

  _EventFeedItemState createState() => new _EventFeedItemState();
}

class _EventFeedItemState extends State<EventFeedItem> {
  bool isLiked;

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                /*Container(
                  height: 120,
                  child: EventAvatar(
                    this.widget._event,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),*/
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 20,
                    color: Controller().theming.primary,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'test',
                            style: TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 1),
                          ),
                          Icon(
                            Icons.textsms,
                            size: 28,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    color: Controller().theming.primary.withOpacity(0.8),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '123',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Controller().theming.primary,
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            '123',
                            style: TextStyle(color: Controller().theming.primary, fontSize: 14, letterSpacing: 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //start info
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.near_me, size: 28, color: Controller().theming.primary),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 4, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '123',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 16, color: Controller().theming.primary),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    '2',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Controller().theming.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(width: 255, height: 57, child: Container() //TODO

                              ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.directions_run, size: 26, color: Controller().theming.primary),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              '12',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Controller().theming.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Icon(Icons.group, size: 26, color: Controller().theming.primary),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              'd',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Controller().theming.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
