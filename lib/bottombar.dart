import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:syhmusic/view/seekbar.dart';

import 'viewmodel/durationmodel.dart';
import 'viewmodel/playcontrolmodel.dart';

class bottombar extends StatefulWidget {
  final PanelController _controller;

  bottombar({@required PanelController controller}) : _controller = controller;

  @override
  State<StatefulWidget> createState() {
    return BottomState();
  }
}

class BottomState extends State<bottombar> {
  bool mcursong = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: double.infinity,
        child: Consumer(builder: (context, PlayControlModel control, _) {
          if (control.getcursong != null) {
            mcursong = true;
          }
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                  ),
                  child: Image.network(
                      mcursong ? control.getcursong.albumImage : "dsadasdasd"),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  mcursong
                                      ? control.getcursong.albumName
                                      : "Song name",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 6.0,
                                ),
                                Text(
                                  mcursong
                                      ? control.getcursong.artistName
                                      : "Song singer",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Consumer(
                            builder: (context, PlayControlModel control, _) {
                          if (control.states == AudioPlayState.paused ||
                              control.states == AudioPlayState.stopped) {
                            return IconButton(
                              icon: Icon(
                                Icons.play_circle_outline,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                control.play();
                              },
                              iconSize: 60,
                            );
                          } else if (control.states == AudioPlayState.playing) {
                            return IconButton(
                              icon: Icon(
                                Icons.pause_circle_outline,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                control.pause();
                              },
                              iconSize: 60,
                            );
                          } else if (control.states ==
                              AudioPlayState.buffering) {
                            return Container(
                              margin: EdgeInsets.all(12.0),
                              height: 45,
                              width: 45,
                              child: CircularProgressIndicator(
                                  strokeWidth: 5.0,
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white)),
                            );
                          }
                          return IconButton(
                            icon: Icon(
                              Icons.play_circle_outline,
                              color: Colors.white,
                            ),
                            onPressed: null,
                            iconSize: 60,
                          );
                        }),
                      ],
                    ),
                    Consumer2(builder: (context, DurtionModel durtion,
                        PlayControlModel _player, _) {
                      Duration tempduration;
                      if (mcursong) {
                        tempduration = Duration(
                            days: 0,
                            hours: 0,
                            minutes: 0,
                            seconds: _player.cursong.duration.toInt(),
                            milliseconds: 0,
                            microseconds: 0);
                      }
                      final duration =
                          durtion.duration ?? tempduration ?? Duration.zero;
                      var position = durtion.position ?? Duration.zero;
                      if (position > duration) {
                        position = duration;
                      }
                      return Container(
                        height: 20,
                        width: double.infinity,
                        child: SeekBar(
                            onChangeEnd: (newPosition) {
                              _player.seekto(newPosition);
                            },
                            duration: duration,
                            position: position),
                      );
                    })
                  ],
                )),
              ],
            ),
          );
        }));
  }
}
