import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:syhmusic/unusedui/baseappbar.dart';

class player extends StatefulWidget {
  final PanelController _controller;

  player({@required PanelController controller}) : _controller = controller;

  @override
  _playerState createState() => _playerState();
}

class _playerState extends State<player> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseViewBar(
        childView: Container(
            child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_downward,
                color: Colors.black38,
              ),
              onPressed: () => widget._controller.close(),
            ),
            Text(
              "SyhMusic",
              style: TextStyle(color: Colors.black38, fontSize: 24),
            ),
          ],
        )),
        preferredSize: Size.fromHeight(60),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Container(
                    child: ClipOval(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.network(
                        "null",
                        height: 300,
                        width: 300,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
            ),
            flex: 3,
          ),
          Container(
            height: 1,
            color: Colors.black26,
          ),
          Expanded(
            child:  Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [
                      0.0,
                      0.7,
                    ],
                    colors: [
                      Color(0xFF47ACE1),
                      Color(0xFFDF5F9D),
                    ],
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(width: 20),
                    IconButton(
                        icon: Icon(Icons.replay),
                        onPressed: null,
                        iconSize: 30),
                    IconButton(
                        icon: Icon(Icons.skip_previous),
                        onPressed: () {},
                        iconSize: 60),
                    IconButton(
                        icon: Icon(Icons.play_circle_outline),
                        onPressed: null,
                        iconSize: 60),
                    IconButton(
                        icon: Icon(Icons.skip_next),
                        onPressed: null,
                        iconSize: 60),
                    IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: null,
                        iconSize: 30),
                    SizedBox(width: 20),
                  ],
                ),
              ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
