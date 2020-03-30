import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syhmusic/viewmodel/playcontrolmodel.dart';
import 'package:syhmusic/viewmodel/spmodel.dart';

class PreferencesBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2(
        builder: (context, SpModel sp, PlayControlModel control, _) {
          sp.updatacycle();
          sp.updataradom();
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
                        control.updataplaystatus();
                      },
                      icon: Icon(
                      Icons.loop,
                      size: 35,
                      color: iscycle ? Color(0xFF7B92CA) : Color(0xFFC7D2E3),
                    ),);
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
                        control.updataplaystatus();
                      },
                      icon: Icon(
                        Icons.shuffle,
                        size: 35,
                        color: isshuffle ? Color(0xFF7B92CA) : Color(
                            0xFFC7D2E3),
                      ),
                    );
                  }),
            ],
          );
        });
  }
}
