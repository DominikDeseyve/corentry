import 'dart:async';
import 'package:corentry/logic/Controller.dart';
import 'package:corentry/models/User.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Authentificator {
  FirebaseAuth firebaseAuth;
  FirebaseUser _firebaseUser;
  FlutterSecureStorage storage;
  Controller _controller;

  User _user;

  Authentificator(pController) {
    this._controller = pController;
    this.firebaseAuth = FirebaseAuth.instance;
    this.storage = new FlutterSecureStorage();
  }

  Future<void> _initSignIn() async {
    this._user = await this._controller.firebase.getUserData(this._firebaseUser.uid);
  }
/*
  Future initUserData(RegisterUser pUser) async {
    this.sendVerificationMail();
    if (this._firebaseUser != null) {
      this._mainController.api.initUserData(_firebaseUser.uid, _firebaseUser.email, pUser);
      this._mainController.showToast('Benutzer erfolgreich erstellt!');
    }
  }

  Future<dynamic> signUpStandard(RegisterUser pUser) async {
    try {
      AuthResult authResult = await this.firebaseAuth.createUserWithEmailAndPassword(email: pUser.email, password: pUser.password);
      _firebaseUser = authResult.user;
      if (_firebaseUser != null) {
        return true;
      }
    } catch (e) {
      return e;
    }
    return false;
  }*/

  Future<bool> signInStandard(String pEmail, String pPassword) async {
    AuthResult authResult = await this.firebaseAuth.signInWithEmailAndPassword(email: pEmail, password: pPassword);
    print(authResult);
    this._firebaseUser = authResult.user;
    if (this._firebaseUser != null) {
      await this._initSignIn();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> isUserVerified() async {
    await this._firebaseUser.reload();
    return this._firebaseUser.isEmailVerified;
  }

  Future<void> sendVerificationMail() async {
    try {
      await this._firebaseUser.sendEmailVerification();
    } catch (e) {
      print("An error occured while trying to send email verification");
      print(e.message);
    }
  }

  //***********************************//
  //*********   SIGN OUT    ***********//
  //***********************************//
  Future<bool> signOut() async {
    await this.firebaseAuth.signOut();
    return true;
  }

  //***********************************//
  //*********   DELETE    ***********//
  //***********************************//
  Future<void> delete() async {
    await this._firebaseUser.delete();
  }
/*
  Future<bool> authentificate() async {
    FirebaseUser user = await this.firebaseAuth.currentUser();
    if (user != null) {
      this._firebaseUser = user;
      this._mainController.currentUser = await this._mainController.api.getUserData(user.uid);

      return true;
    } else {
      return false;
    }
  }*/
}
