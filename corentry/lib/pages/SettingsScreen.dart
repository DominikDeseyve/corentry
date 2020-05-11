import 'dart:io';
import 'package:corentry/logic/Controller.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController _firstnameController;
  TextEditingController _lastnameController;
  TextEditingController _mailController;

  File _imageURL;
  bool _emailConfirmation = false;

  void initState() {
    super.initState();
  }

  void _save() {}

  Widget _buildEmailConfirmationButton() {
    if (this._emailConfirmation) {
      return FlatButton(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Text(
          'Bestätigen',
          style: TextStyle(
            color: Controller().theming.secondary,
          ),
        ),
        onPressed: () {},
        color: Colors.redAccent,
      );
    } else {
      return FlatButton(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Text(
          'Bestätigt!',
          style: TextStyle(
            color: Controller().theming.secondary,
          ),
        ),
        onPressed: () {
          Controller().authentificator.sendVerificationMail().then((_) {});
        },
        color: Controller().theming.primary,
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Controller().theming.secondary,
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Controller().theming.primary,
              size: 26,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Profil bearbeiten',
            style: TextStyle(fontFamily: 'Lato light', color: Controller().theming.primary, fontSize: 20),
          ),
          actions: <Widget>[
            IconButton(
              color: Controller().theming.primary,
              icon: Icon(
                Icons.check,
                size: 26,
              ),
              onPressed: this._save,
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
              child: Container(width: 130, height: 130, color: Colors.black),
            ),
          ),
          FlatButton(
            onPressed: () {},
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              'Profilbild ändern',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18,
                color: Controller().theming.primary,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _firstnameController,
                    obscureText: false,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      hintText: 'Vorname',
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: 'Max',
                      labelStyle: TextStyle(
                        color: Controller().theming.primary,
                        fontSize: 18,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.people,
                    color: Controller().theming.primary.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _lastnameController,
                    obscureText: false,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      hintText: 'Nachname',
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: 'Mustermann',
                      labelStyle: TextStyle(
                        color: Controller().theming.primary,
                        fontSize: 18,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.people,
                    color: Controller().theming.primary.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 15, bottom: 6),
            child: Text(
              "Weitere Einstellungen",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Controller().theming.primary,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _mailController,
                    obscureText: false,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      hintText: 'max@mustermann.de',
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: 'E-Mail Adresse',
                      labelStyle: TextStyle(
                        color: Controller().theming.primary,
                        fontSize: 18,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                this._buildEmailConfirmationButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
