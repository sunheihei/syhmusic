import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syhmusic/db/songdbprovider.dart';
import 'package:syhmusic/viewmodel/dbmodel.dart';
import 'package:syhmusic/viewmodel/playcontrolmodel.dart';
import 'package:syhmusic/viewmodel/spmodel.dart';

class PreferencesBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer3(builder: (context, SpModel sp, PlayControlModel control, DBModel dbModel, _) {
      sp.updatacycle();
      sp.updataradom();
      if (control.cursong != null) {
        dbModel.updataFav(control.cursong.songid);
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            onPressed: () {
              if (!dbModel.mIsFav) {
                dbModel.saveFav(control.cursong);
              } else {
                dbModel.deleteFav(control.cursong);
              }
            },
            icon: Icon(
              Icons.favorite,
              size: 35,
              color: !dbModel.mIsFav ? Color(0xFFC7D2E3) : Color(0xFF7B92CA),
            ),
          ),
          IconButton(
            onPressed: () {
              sp.setCycle(!sp.cycle);
            },
            icon: Icon(
              Icons.loop,
              size: 35,
              color: sp.cycle ? Color(0xFF7B92CA) : Color(0xFFC7D2E3),
            ),
          ),
          IconButton(
            onPressed: () {
              sp.setShuffle(!sp.shuffle);
            },
            icon: Icon(
              Icons.shuffle,
              size: 35,
              color: sp.shuffle ? Color(0xFF7B92CA) : Color(0xFFC7D2E3),
            ),
          ),
        ],
      );
    });
  }
}
