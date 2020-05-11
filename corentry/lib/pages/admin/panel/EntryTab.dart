import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'package:corentry/logic/Controller.dart';
import 'package:corentry/widgets/EventAvatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class EntryTab extends StatefulWidget {
  _EntryTabState createState() => _EntryTabState();
}

class _EntryTabState extends State<EntryTab> {
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        EventAvatar(
          height: 160,
          width: MediaQuery.of(context).size.width,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
          child: Text(
            'Ihr Code',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 20),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CodeDialog(),
          ],
        ),
      ],
    );
  }

  void dispose() {
    super.dispose();
  }
}

class CodeDialog extends StatefulWidget {
  _CodeDialogState createState() => _CodeDialogState();
}

class _CodeDialogState extends State<CodeDialog> {
  GlobalKey globalKey = new GlobalKey();
  String _qrCode;

  void initState() {
    super.initState();
    this._qrCode = '123';
  }

  Future<void> _refreshCode() async {
    int length = 31;
    final Random _random = Random.secure();
    var values = List<int>.generate(length, (i) => _random.nextInt(256));
    String qrCode = base64Url.encode(values);
    Controller().firebase.updateCode(Controller().authentificator.user.companies[0], qrCode);
    setState(() {
      this._qrCode = qrCode;
    });
  }

  Future<void> _captureAndOpen() async {
    try {
      RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
      var image = await boundary.toImage();
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();

      final tempDir = await getTemporaryDirectory();
      File file = await new File('${tempDir.path}/image.png').create();
      await file.writeAsBytes(pngBytes);

      OpenFile.open(file.path);
    } catch (e) {
      print(e.toString());
    }
  }

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RepaintBoundary(
            key: globalKey,
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: (this._qrCode != null
                            ? QrImage(
                                data: _qrCode,
                                backgroundColor: Colors.white,
                                size: 200,
                                gapless: true,
                                foregroundColor: Colors.black87,
                                onError: (ex) {
                                  print("[QR] ERROR - $ex");
                                },
                              )
                            : Container(
                                width: 200,
                                height: 200,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    valueColor: new AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                  ),
                                ),
                              )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                color: Colors.grey,
                iconSize: 24,
                onPressed: () {
                  _captureAndOpen();
                },
                icon: Icon(Icons.open_in_new),
              ),
              IconButton(
                color: Colors.grey,
                iconSize: 24,
                onPressed: () {
                  return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text('Wollen Sie wirklich einen neuen Qr-Code ausdrucken?'),
                        actions: [
                          FlatButton(
                            child: Text(
                              'Ja',
                              style: TextStyle(color: Controller().theming.primary),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              this._refreshCode();
                            },
                          ),
                          FlatButton(
                            child: Text(
                              'Abbrechen',
                              style: TextStyle(color: Controller().theming.tertiary),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: Icon(Icons.refresh),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
