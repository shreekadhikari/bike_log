import 'package:flutter/material.dart';

import './modified_widget.dart';

class ContentUpdates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
//      color: Colors.purple[400],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.purple[50],
              child: Text(
                "Last update:",
                style: TextStyle(fontWeight: FontWeight.w600),
              )),
          Container(
            color: Colors.purple[400],
            padding: EdgeInsets.all(16.0),
            child: Row(
//              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: TextBoldWhiteLarge('Odometer:'),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    child: Center(child: TextBoldWhiteLarge('123456')),
                  ),
                  flex: 1,
                )
              ],
            ),
          ),
          Container(
            color: Colors.purple[400],
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: TextBoldWhiteLarge('Refuel:'),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    child: Center(child: TextBoldWhiteLarge('A day ago')),
                  ),
                  flex: 1,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
