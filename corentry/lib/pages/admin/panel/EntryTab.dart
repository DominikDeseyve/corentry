import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:corentry/pages/admin/panel/InvitationTab.dart';
import 'package:corentry/widgets/EventAvatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
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
        Header('Ihre Codes'),
        Row(
          children: [
            CodeDialog(),
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

/*
  Future<void> _captureAndShare() async {
    try {
      RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
      var image = await boundary.toImage(pixelRatio: 4.0);
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();

      final tempDir = await getTemporaryDirectory();
      File file = await new File('${tempDir.path}/image.png').create();
      await file.writeAsBytes(pngBytes);

      Uri link = await Controller().linker.generateShortLink(this.widget._playlist);

      await WcFlutterShare.share(
        sharePopupTitle: 'Playlist teilen',
        subject: this.widget._playlist.name,
        text: 'Hey du, hast Du Lust meiner Playlist auf CMP beizutreten? \nPlaylist: ' +
            this.widget._playlist.name +
            '\n' +
            'Teilnehmeranzahl: ' +
            this.widget._playlist.maxAttendees.toString() +
            '\nIch freue mich auf Dich! \n' +
            link.toString(),
        fileName: 'image.png',
        mimeType: 'image/png',
        bytesOfFile: byteData.buffer.asUint8List(),
      );
    } catch (e) {
      print(e.toString());
    }
  }
*/
  Future<void> _captureAndOpen() async {
    try {
      RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
      var image = await boundary.toImage();
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();

      final tempDir = await getTemporaryDirectory();
      File file = await new File('${tempDir.path}/image.png').create();
      await file.writeAsBytes(pngBytes);

      //OpenFile.open(file.path);
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                    child: Text(
                      'Zugangscode',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 5),
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                color: Colors.grey,
                iconSize: 26,
                onPressed: () {
                  //  _captureAndShare();
                },
                icon: Icon(Icons.share),
              ),
              IconButton(
                color: Colors.grey,
                iconSize: 26,
                onPressed: () {
                  _captureAndOpen();
                },
                icon: Icon(Icons.open_in_new),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
