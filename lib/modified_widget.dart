import 'package:flutter/material.dart';

class TextBoldWhiteLarge extends StatelessWidget {
  final String text;

  TextBoldWhiteLarge(this.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
    );
  }
}

class TextBoldWhiteNormal extends StatelessWidget {
  final String text;

  TextBoldWhiteNormal(this.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(text,
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white));
  }
}
