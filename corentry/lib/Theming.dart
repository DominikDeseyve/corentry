import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Theming {
  Color _primary, _secondary, _accent, _tertiary;
  Color _fontPrimary, _fontSecondary, _fontAccent, _fontTertiary;
  Color _background, _navigation;

  double _fontSizePrimary;

  Theming() {
    this.initLight();
  }

  void initLight() {
    _fontSizePrimary = 16;

    _primary = Color(0xFF002F62);
    _secondary = Colors.white;
    _tertiary = Colors.grey;
    _accent = Color(0xFF0076BA);

    _fontPrimary = Colors.black;
    _fontSecondary = Colors.white;
    _fontTertiary = Colors.grey;
    _fontAccent = Colors.redAccent;

    _background = Color(0xFFF5F5F5);
    _navigation = Color(0xFF0076BA);
  }

  // Getter

  double get fontSizePrimary {
    return this._fontSizePrimary;
  }

  Color get primary {
    return this._primary;
  }

  Color get secondary {
    return this._secondary;
  }

  Color get tertiary {
    return this._tertiary;
  }

  Color get accent {
    return this._accent;
  }

  Color get fontPrimary {
    return this._fontPrimary;
  }

  Color get fontSecondary {
    return this._fontSecondary;
  }

  Color get fontTertiary {
    return this._fontTertiary;
  }

  Color get fontAccent {
    return this._fontAccent;
  }

  Color get background {
    return this._background;
  }

  Color get navigation {
    return this._navigation;
  }

  //Flushbar alternative
  void showSnackbar(BuildContext pContext, String pText) {
    Flushbar flushbar;
    flushbar = Flushbar(
      message: pText,
      icon: Icon(
        Icons.info_outline,
        size: 26,
        color: Colors.white,
      ),
      margin: EdgeInsets.all(8),
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
      borderRadius: 8,
      duration: Duration(seconds: 3),
      leftBarIndicatorColor: Colors.blueAccent,
      forwardAnimationCurve: Curves.linear,
      animationDuration: Duration(milliseconds: 250),
      mainButton: FlatButton(
        onPressed: () {
          flushbar.dismiss(true); // result = true
        },
        child: Text(
          "OK",
          style: TextStyle(color: Colors.blueAccent),
        ),
      ), // <b
    )..show(pContext);
  } //Flushbar alternative

  void showNotImplemented(BuildContext pContext) {
    Flushbar flushbar;
    flushbar = Flushbar(
      message: 'Not implemented yet.',
      icon: Icon(
        Icons.warning,
        size: 26,
        color: Colors.white,
      ),
      margin: EdgeInsets.all(8),
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
      borderRadius: 8,
      duration: Duration(seconds: 3),
      leftBarIndicatorColor: Colors.blueAccent,
      forwardAnimationCurve: Curves.linear,
      animationDuration: Duration(milliseconds: 250),
      mainButton: FlatButton(
        onPressed: () {
          flushbar.dismiss(true); // result = true
        },
        child: Text(
          "OK",
          style: TextStyle(color: Colors.blueAccent),
        ),
      ), // <b
    )..show(pContext);
  }

  void showNoInternet(BuildContext pContext) {
    Flushbar flushbar;
    flushbar = Flushbar(
      message: 'You need an internet connection to perform this action',
      icon: Icon(
        Icons.warning,
        size: 26,
        color: Colors.white,
      ),
      margin: EdgeInsets.all(8),
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
      borderRadius: 8,
      duration: Duration(seconds: 3),
      leftBarIndicatorColor: Colors.blueAccent,
      forwardAnimationCurve: Curves.linear,
      animationDuration: Duration(milliseconds: 250),
      mainButton: FlatButton(
        onPressed: () {
          flushbar.dismiss(true); // result = true
        },
        child: Text(
          "OK",
          style: TextStyle(color: Colors.blueAccent),
        ),
      ), // <b
    )..show(pContext);
  }
}
