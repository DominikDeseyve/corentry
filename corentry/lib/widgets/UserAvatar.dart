import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final double width;
  final Key key;

  UserAvatar({this.width = 60.0, this.key});

  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(50),
      ),
      clipBehavior: Clip.hardEdge,
      color: Colors.white,
      child: Image(
        width: this.width,
        height: this.width,
        fit: BoxFit.cover,
        image: AssetImage('assets/images/defautlt-user-avatar.jpg'),
      ),
    );
  }
}
