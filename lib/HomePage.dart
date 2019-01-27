import 'package:flutter/material.dart';

import './parts_model.dart';
import './database.dart';

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
        children: <Widget>[_ContentSummary(), _ContentFuel(), _ContentParts()],
      ),
    );
  }
}

class _ContentSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Text('Your average mileage is:'),
          Row(
            children: <Widget>[],
          )
        ],
      ),
    );
  }
}

class _ContentFuel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('Yo');
  }
}

class _ContentParts extends StatelessWidget {
  Future<List<Part>> fetchPartsFromDatabase() async {
    var dbHelper = DBHelper();
    Future<List<Part>> memos = dbHelper.getPart();
    return memos;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.purple[50],
              child: Text(
                "Latest parts:",
                style: TextStyle(fontWeight: FontWeight.w600),
              )),
          _ListItem(
            sn: 'S.N',
            name: 'Name of Item',
            cost: 'Price',
          ),
          FutureBuilder<List<Part>>(
            future: fetchPartsFromDatabase(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.length == 0) {
                  return Center(
                    child: _ListItem(
                      sn: '--',
                      name: '--',
                      cost: '--',
                    ),
                  );
                }
                return _ListItem(
                  sn: snapshot.data.length.toString(),
                  name: snapshot.data[0].name,
                  cost: snapshot.data[0].price,
                );
//                return ListView.builder(
//                    itemCount: snapshot.data.length,
//                    itemBuilder: (BuildContext context, int index) {
//                      return _ListItem(
//                        sn: index.toString(),
//                        name: snapshot.data[index].name,
//                        cost: snapshot.data[index].price,
//                      );
//                    });
              } else if (snapshot.hasError) {
                return Text('Data error');
              }
              return Container(
                alignment: AlignmentDirectional.center,
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final String sn, name, cost;

  const _ListItem({Key key, this.sn, this.name, this.cost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.greenAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(12.0),
              width: 50.0,
              child: Text(
                sn,
                style: TextStyle(fontWeight: FontWeight.w600),
              )),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(12.0),
              width: 200.0,
              child: Text(name, style: TextStyle(fontWeight: FontWeight.w600))),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(12.0),
              width: 100.0,
              child: Text(cost, style: TextStyle(fontWeight: FontWeight.w600))),
        ],
      ),
    );
  }
}
