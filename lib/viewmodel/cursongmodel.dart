import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:syhmusic/module/song.dart';

class CursongModel with ChangeNotifier {
  List<Results> _songlist = new List();
  int _mcurpositon;

  Results get getcursong =>
      _songlist.isNotEmpty ? _songlist[_mcurpositon] : null;

  List<Results> get songlist => _songlist;

  void setCurListSong(List<Results> songlist, int position) {
    if (_songlist.isEmpty || _songlist.last != songlist.last) {
      _songlist.clear();
      _songlist.addAll(songlist);
      print("new list");
    }
    _mcurpositon = position;
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
