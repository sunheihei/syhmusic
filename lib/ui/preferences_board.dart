import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class PreferencesBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.favorite,
            size: 35,
            color: !false ? Color(0xFFC7D2E3) : Color(0xFF7B92CA),
          ),
        ),
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.loop,
            size: 35,
            color: false ? Color(0xFFC7D2E3) : Color(0xFF7B92CA),
          ),
        ),
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.shuffle,
            size: 35,
            color: false ? Color(0xFFC7D2E3) : Color(0xFF7B92CA),
          ),
        ),
      ],
    );
  }
}
