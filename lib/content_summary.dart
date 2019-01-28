import 'package:flutter/material.dart';

class ContentSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.purple[400],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 36.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Text(
                      'Average \nMileage:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    width: 100,
                    padding: EdgeInsets.only(top: 10),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '30',
                          style: TextStyle(
                              fontSize: 80,
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
                  ),
                  flex: 2,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 36.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Text(
                      'Average \nCost:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    width: 100,
                    padding: EdgeInsets.only(top: 10),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      'Rs. 1200',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    width: 100,
                  ),
                  flex: 2,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
