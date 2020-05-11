import 'package:corentry/logic/Controller.dart';
import 'package:flutter/material.dart';

class HugeLoader {
  static Widget show() {
    //logout
    if (Controller().authentificator.user == null) {
      return Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(
              Controller().theming.primary,
            ),
          ),
        ),
      );
    }

    //normal
    return Container(
      color: Controller().theming.background,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(
            Controller().theming.primary,
          ),
        ),
      ),
    );
  }
}
