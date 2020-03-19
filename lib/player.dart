import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syhmusic/view/BaseAppBar.dart';
import 'package:syhmusic/view/playappbar.dart';

import 'viewmodel/CurSongModel.dart';

class Player extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseViewBar(
        childView: playappbar(),
        preferredSize: Size.fromHeight(50.0),
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
    return Container(
      child: Consumer<CurSongModel>(
        builder: (context, CurSongModel cursong, child) {
          if (cursong.value != null) {
            return Text(cursong.value.albumName);
          }
          return Text("SyhMusic");
        },
      ),
    );
  }
}
