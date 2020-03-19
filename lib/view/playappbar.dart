import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syhmusic/viewmodel/CurSongModel.dart';

class playappbar extends StatefulWidget {
  @override
  _playappbarState createState() => _playappbarState();
}

class _playappbarState extends State<playappbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).accentColor,
        height: 56,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: null,
            ),
//            Consumer<CurSongModel>(
//              builder: (context, CurSongModel cursong, _) {
//                if (cursong.value != null) {
//                  return Text(cursong.value.albumName);
//                }
//                return Text("SyhMusic");
//              },
//            ),
          ],
        ));
  }
}
