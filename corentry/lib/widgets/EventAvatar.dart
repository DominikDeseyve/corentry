import 'package:flutter/material.dart';

class EventAvatar extends StatelessWidget {
  final double width;
  final double height;
  final bool clickable;

  EventAvatar({this.width = 60.0, this.height: 60.0, this.clickable = false});

  Widget build(BuildContext context) {
    return Image(
      fit: BoxFit.cover,
      width: this.width,
      height: this.height,
      image: AssetImage('assets/images/impuls.jpg'),
    );
  }
}
