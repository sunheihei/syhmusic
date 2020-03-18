import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Player"),
      ),
      body: PlayerMain(),
    );
  }
}

class PlayerMain extends StatefulWidget {
  @override
  _PlayerMainState createState() => _PlayerMainState();
}

class _PlayerMainState extends State<PlayerMain> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
