import 'dart:developer';
import 'package:corentry/logic/Authentificator.dart';
import 'package:corentry/logic/Firestore.dart';
import 'package:intl/intl.dart';
import 'package:corentry/Theming.dart';
import 'package:intl/date_symbol_data_local.dart';

enum APIRequestType {
  GET,
  POST,
  PUT,
}

/// Singleton Controller of the whole structure.
class Controller {
  Theming _theming;
  Authentificator _authentificator;
  Firebase _firebase;

  static final Controller _controller = Controller._internal();

  factory Controller() {
    return _controller;
  }

  Controller._internal() {
    log("CONSTRUCTOR OF CONTROLLER");
    Intl.defaultLocale = 'de_DE';
    initializeDateFormatting();
    this._authentificator = Authentificator(this);

    this._theming = Theming();
    this._firebase = Firebase();
  }

  //***************************************************//
  //*********   GETTER
  //***************************************************//

  Theming get theming => this._theming;

  Authentificator get authentificator => this._authentificator;

  Firebase get firebase => this._firebase;
}
