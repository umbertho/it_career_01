import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  FirstPageState createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
    alignment: Alignment.center,
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Text( "Row 1" ),
        new Text( "Row 2" ),
        RaisedButton(
          child: Text( 'Go to second' ),
          onPressed: () {
//                dispose();
            // Pushing a named route
            Navigator.of( context )
                .pushNamed( "/second", arguments: {"index": 0} );
          },
        )
      ],
    ),
  );}
}


