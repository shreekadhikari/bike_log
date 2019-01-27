import 'package:flutter/material.dart';

import './part_model.dart';
import './database.dart';
import './modified_widget.dart';

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
          _ContentSummary(),
          Divider(
            height: 16.0,
          ),
          _ContentFuel(),
          Divider(
            height: 16.0,
          ),
          _ContentParts()
        ],
      ),
    );
  }
}

class _ContentSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.purple[400],
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 36.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    'Average Mileage:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  width: 100,
                  padding: EdgeInsets.only(top: 10),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        '30',
                        style: TextStyle(
                            fontSize: 75,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      width: 100,
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(top: 25.0),
                      child: Text(
                        'kmpl',
                        style: TextStyle(color: Colors.white),
                      ),
                      width: 50,
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 36.0),
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    'Average Cost:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  width: 100,
                  padding: EdgeInsets.only(top: 10),
                ),
                Container(
                  child: Text(
                    'Rs. 1200',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  width: 100,
                )
              ],
            ),
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
    return Container(
      color: Colors.purple[400],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: TextBoldWhiteLarge('Last updated odometer:'),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    child: Center(child: TextBoldWhiteLarge('123456')),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: TextBoldWhiteLarge('Last updated odometer:'),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    child: Center(child: TextBoldWhiteLarge('A day ago')),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
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
      color: Colors.purple[400],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(12.0),
              width: 50.0,
              child: Text(
                sn,
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
              )),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(12.0),
              width: 200.0,
              child: Text(name,
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white))),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(12.0),
              width: 100.0,
              child: Text(cost,
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white))),
        ],
      ),
    );
  }
}
