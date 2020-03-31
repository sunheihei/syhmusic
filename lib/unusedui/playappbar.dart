import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class playappbar extends StatefulWidget {
  @override
  _playappbarState createState() => _playappbarState();
}

class _playappbarState extends State<playappbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black38,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        Text(
          "SyhMusic",
          style: TextStyle(color: Colors.black38, fontSize: 24),
        ),
      ],
    ));
  }
}
