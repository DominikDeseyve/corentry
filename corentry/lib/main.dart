import 'package:corentry/logic/RouteController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(Corentry());
}

class Corentry extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corentry',
      onGenerateRoute: RouteController.generateRoute,
      theme: new ThemeData(
        fontFamily: 'Lato regular',
        scaffoldBackgroundColor: Color(0xFFF9F9F9),
        bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.black),
      ),

      initialRoute: '/', //do not rename this, otherwise error, see: https://stackoverflow.com/questions/51915883/flutter-navigator-dynamic-initial-route
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('de', 'DE'),
        const Locale('en', 'US'),
      ],
    );
  }
}
