
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syhmusic/viewmodel/cursongmodel.dart';

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
            Consumer<CursongModel>(
              builder: (context, CursongModel cursong, _) {
                return Text(
                  cursong.getcursong != null ? cursong.getcursong.albumName : "SyhMusic",
                  style: TextStyle(color: Colors.black38,fontSize: 24),
                );
              },
            ),
          ],
        ));
  }
}
