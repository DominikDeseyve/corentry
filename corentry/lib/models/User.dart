import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String _uid;
  String _firstname;
  String _lastname;
  String _mail;

  String _imageURL;

  User.fromFirebase(DocumentSnapshot pSnap) {
    print(pSnap);
    print("USER CONSTRUCTOR");
  }

  //***************************************************//
  //*********   SETTER
  //***************************************************//
  set uid(String pUID) {
    this._uid = pUID;
  }

  String get uid {
    return this._uid;
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
}
