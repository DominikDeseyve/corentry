import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String _userID;
  String _firstname;
  String _lastname;
  String _mail;

  bool _isCompany;
  List<String> _companies;

  String _imageURL;

  User.fromFirebase(DocumentSnapshot pSnap) {
    this._userID = pSnap.documentID;
    this._firstname = pSnap['firstname'];
    this._lastname = pSnap['lastname'];

    if (pSnap['mode'] != null) {
      this._isCompany = (pSnap['mode'] != 'USER');
      this._companies = pSnap['companies'].cast<String>();
    }
  }

  //***************************************************//
  //*********   SETTER
  //***************************************************//
  set userID(String pUID) {
    this._userID = pUID;
  }

  String get userID {
    return this._userID;
  }

  set imageURL(String pImageURL) {
    this._imageURL = pImageURL;
  }

  String get imageURL {
    return this._imageURL;
  }

  set firstname(String pFirstname) {
    this._firstname = pFirstname;
  }

  String get firstname {
    return this._firstname;
  }

  set lastname(String pLastname) {
    this._lastname = pLastname;
  }

  String get lastname {
    return this._lastname;
  }

  set mail(String pUsername) {
    this._mail = pUsername;
  }

  String get mail {
    return this._mail;
  }

  List<String> get companies => this._companies;

  bool get isCompany => this._isCompany;
}
