import 'package:flutter/material.dart';

class bottombar extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return BottomState();
  }

}

class BottomState extends State<bottombar> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 56,
       color: Colors.white,
      child: Row(
        children: <Widget>[
        ],
      ),
    );
  }

}