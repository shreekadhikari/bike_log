import 'package:flutter/material.dart';

import './content_updates.dart';
import './content_parts.dart';
import './content_summary.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ContentMain();
  }
}

class _ContentMain extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    var dbHelper = DBHelper();
//    dbHelper.savePart(Part('Brake', '350'));
//    dbHelper.savePart(Part('Oil', '850'));
//    dbHelper.savePart(Part('Cable', '150'));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(24.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ContentSummary(),
            flex: 1,
          ),
          Divider(
            height: 16.0,
          ),
          Expanded(
            child: ContentUpdates(),
            flex: 1,
          ),
          Divider(
            height: 16.0,
          ),
          Expanded(
            child: ContentParts(),
            flex: 1,
          )
        ],
      ),
    );
  }
}
