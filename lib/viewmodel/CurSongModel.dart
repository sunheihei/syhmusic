import 'package:flutter/cupertino.dart';
import 'package:syhmusic/module/song.dart';

class CurSongModel with ChangeNotifier {

  Results _mcursong;

  Results get value => _mcursong;

  void setCurSong(Results song) {
    _mcursong = song;
    notifyListeners();
  }

}
