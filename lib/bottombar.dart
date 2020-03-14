import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Viewmodel/CurSongModel.dart';

class bottombar extends StatefulWidget {
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
        child: Consumer<CurSongModel>(
          builder: (context, CurSongModel cursong, _) {
            if (cursong.value != null) {
              return Text(cursong.value.albumName.toString());
            }
            return Text("");
          },
//        builder: (context,CurSongModel cursong, _)=>Text(
//            cursong.value.albumName.toString()
//        )
        ));
  }
}
