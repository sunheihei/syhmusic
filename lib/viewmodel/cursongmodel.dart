import 'package:flutter/material.dart';
import 'package:syhmusic/module/song.dart';

class cursongmodel with ChangeNotifier {

  Results _mcursong;

  Results get value => _mcursong;

  void setCurSong(Results song) {
    _mcursong = song;
    notifyListeners();
  }

}
