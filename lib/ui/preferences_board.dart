import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syhmusic/db/songdbprovider.dart';
import 'package:syhmusic/viewmodel/dbmodel.dart';
import 'package:syhmusic/viewmodel/playcontrolmodel.dart';
import 'package:syhmusic/viewmodel/spmodel.dart';

class PreferencesBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer3(builder:
        (context, SpModel sp, PlayControlModel control, DBModel dbModel, _) {
      sp.updatacycle();
      sp.updataradom();

      if (control.cursong != null) {
        dbModel.updataFav(control.cursong.songid);
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          StreamBuilder(
            stream: dbModel.favstreamController.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Icon(
                  Icons.favorite,
                  size: 35,
                  color: Color(0xFFC7D2E3),
                );
              }
              bool isfav = snapshot.data;
              print("isfav $isfav");
              return IconButton(
                onPressed: () {
                  if (!isfav) {
                    dbModel.saveFav(control.cursong);
                  } else {
                    dbModel.deleteFav(control.cursong);
                  }
                },
                icon: Icon(
                  Icons.favorite,
                  size: 35,
                  color: !isfav ? Color(0xFFC7D2E3) : Color(0xFF7B92CA),
                ),
              );
            },
          ),
          StreamBuilder(
              stream: sp.cyclestreamController.stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Icon(
                    Icons.loop,
                    size: 35,
                    color: Color(0xFFC7D2E3),
                  );
                }
                bool iscycle = snapshot.data;
                return IconButton(
                  onPressed: () {
                    sp.setCycle(!iscycle);
                  },
                  icon: Icon(
                    Icons.loop,
                    size: 35,
                    color: iscycle ? Color(0xFF7B92CA) : Color(0xFFC7D2E3),
                  ),
                );
              }),
          StreamBuilder(
              stream: sp.shufflestreamController.stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Icon(
                    Icons.shuffle,
                    size: 35,
                    color: Color(0xFFC7D2E3),
                  );
                }
                bool isshuffle = snapshot.data;
                return IconButton(
                  onPressed: () {
                    sp.setShuffle(!isshuffle);
                  },
                  icon: Icon(
                    Icons.shuffle,
                    size: 35,
                    color: isshuffle ? Color(0xFF7B92CA) : Color(0xFFC7D2E3),
                  ),
                );
              }),
        ],
      );
    });
  }
}
