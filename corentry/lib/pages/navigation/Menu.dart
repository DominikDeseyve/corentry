import 'package:corentry/logic/Controller.dart';
import 'package:corentry/models/Activty.dart';
import 'package:corentry/pages/admin/GuestScreen.dart';
import 'package:corentry/pages/admin/panel/PanelScreen.dart';
import 'package:corentry/pages/user/ActivtyScreen.dart';
import 'package:corentry/pages/user/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class Menu extends StatefulWidget {
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  void initState() {
    super.initState();
  }

  Future<void> _scan() async {
    String qrCode;
    try {
      //qrCode = await BarcodeScanner.scan();
      qrCode = '123';
      Activity activity = await Controller().firebase.runScan(qrCode, Controller().authentificator.user.userID);
      _showDialog(activity);
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

  Future<void> _showDialog(Activity pActivity) async {
    await showDialog(
      context: context,
      builder: (BuildContext dialogContext) => AlertDialog(
        backgroundColor: Controller().theming.background,
        contentPadding: const EdgeInsets.all(20),
        title: Text("Ihr Scan war erfolgreich!"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Sie haben '),
                Text(
                  pActivity.company.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(' ' + (pActivity.activityType == ActivityType.IN ? 'betreten' : 'verlassen') + '!'),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          )
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    print(Controller().authentificator.user.isCompany);
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
                  (Controller().authentificator.user.isCompany ? Icons.person : Icons.home),
                  size: 30,
                ),
              ),
              Tab(
                icon: Icon(
                  (Controller().authentificator.user.isCompany ? Icons.apps : Icons.notifications_active),
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
          children: (Controller().authentificator.user.isCompany
              ? [
                  GuestScreen(),
                  PanelScreen(),
                ]
              : [
                  HomeScreen(),
                  ActivityScreen(),
                ]),
        ),
        floatingActionButton: Container(
          height: 60,
          width: 60,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: Controller().theming.primary,
              child: Icon(Icons.add),
              elevation: 2.0,
              onPressed: _scan,
            ),
          ),
        ),
      ),
    );
  }
}
