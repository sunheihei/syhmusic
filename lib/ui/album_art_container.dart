import 'package:flutter/material.dart';
import 'package:syhmusic/module/song.dart';

class AlbumArtContainer extends StatelessWidget {
  const AlbumArtContainer({
    Key key,
    @required double radius,
    @required double albumArtSize,
    @required Results currentSong,
  })  : _radius = radius,
        _albumArtSize = albumArtSize,
        _currentSong = currentSong,
        super(key: key);

  final double _radius;
  final double _albumArtSize;
  final Results _currentSong;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_radius),
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: _albumArtSize,
            child: Image.network(_currentSong.albumImage,fit: BoxFit.fill),
          ),
          Opacity(
            opacity: 0.20,
            child: Container(
              width: double.infinity,
              height: _albumArtSize,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: [
                    0.0,
                    0.85,
                  ],
                  colors: [
                    Color(0xFF47ACE1),
                    Color(0xFFDF5F9D),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
