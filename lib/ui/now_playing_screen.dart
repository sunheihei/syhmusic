import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:syhmusic/ui/preferences_board.dart';
import 'package:syhmusic/view/seekbar.dart';
import 'package:syhmusic/viewmodel/cursongmodel.dart';
import 'package:syhmusic/viewmodel/durationmodel.dart';
import 'package:syhmusic/viewmodel/playcontrolmodel.dart';

import 'album_art_container.dart';
import 'empty_album_art.dart';
import 'music_board_controls.dart';

class NowPlayingScreen extends StatelessWidget {
  final PanelController _controller;

  NowPlayingScreen({@required PanelController controller})
      : _controller = controller;

  @override
  Widget build(BuildContext context) {
    final double _radius = 25.0;
    final double _screenHeight = MediaQuery.of(context).size.height;
    final double _albumArtSize = _screenHeight / 2;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: _albumArtSize + 50,
            child: Stack(
              children: <Widget>[
                Consumer(builder: (context, PlayControlModel control, _) {
                  if (control.getcursong != null) {
                    if (control.getcursong.albumImage != null) {
                      return AlbumArtContainer(
                        radius: _radius,
                        albumArtSize: _albumArtSize,
                        currentSong: control.getcursong,
                      );
                    }
                  }
                  return EmptyAlbumArtContainer(
                    radius: _radius,
                    albumArtSize: _albumArtSize,
                    iconSize: _albumArtSize / 2,
                  );
                }),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: MusicBoardControls(),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.transparent,
            height: _screenHeight / 15,
          ),
          PreferencesBoard(),
          Divider(
            color: Colors.transparent,
            height: _screenHeight / 15,
          ),
          Consumer(
            builder: (context, PlayControlModel control, _) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "SongName",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFFADB9CD),
                              letterSpacing: 1,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Divider(
                            height: 5,
                            color: Colors.transparent,
                          ),
                          Text(
                            "Singername",
                            style: TextStyle(
                              fontSize: 30,
                              color: Color(0xFF4D6B9C),
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Text(
                        "0:00",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFADB9CD),
                          letterSpacing: 1,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                )),
          ),
          Divider(
            color: Colors.transparent,
            height: _screenHeight / 22,
          ),
          Consumer2(builder: (context, DurtionModel durtion,
              PlayControlModel _player, _) {
            final duration = durtion.duration ?? Duration.zero;
            var position = durtion.position ?? Duration.zero;

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
      ),
    );
  }
}