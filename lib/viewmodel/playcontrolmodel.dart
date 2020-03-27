import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:syhmusic/module/song.dart';
import 'package:syhmusic/viewmodel/cursongmodel.dart';
import 'package:syhmusic/viewmodel/playmanager.dart';

enum AudioPlayState {
  none,
  stopped,
  paused,
  playing,
  connecting,
  completed,
  buffering,
}

class PlayControlModel with ChangeNotifier {
  AudioPlayer _player;
  bool isbuffering;
  AudioPlayState states;

  PlayControlModel() {
    _player = PlayManager.instance;
    _player.fullPlaybackStateStream.listen(onState);
  }

  void seturl(String url) {
    _player.setUrl(url);
  }

  void play() {
    _player.play();
  }

  void pause() {
    _player.pause();
  }

  void seekto(Duration positon) {
    _player.seek(positon);
  }

  void playnext() {
    if (_mcurpositon == _songlist.length - 1 && _songlist.isNotEmpty) {
      _mcurpositon = 0;
    }else{
      _mcurpositon++;
    }
    _player.setUrl(getcursong.audiodownload);
    notifyListeners();
  }

  void playpre() {
    if (_mcurpositon > 0 && _songlist.isNotEmpty) {
      _mcurpositon--;
      _player.setUrl(getcursong.audiodownload);
    }
    notifyListeners();
  }

  void onState(FullAudioPlaybackState event) {
    AudioPlaybackState state = event.state;
    bool buffering = event.buffering;

    if (state == AudioPlaybackState.connecting || buffering == true) {
      print('buffering');
      states = AudioPlayState.buffering;
      notifyListeners();
    }

    if (state == AudioPlaybackState.stopped && buffering == false) {
      _player.play();
      return;
    }

    if (state == AudioPlaybackState.playing) {
      states = AudioPlayState.playing;
      print('playing');
      notifyListeners();
    }

    if (state == AudioPlaybackState.paused) {
      states = AudioPlayState.paused;
      print('paused');
      notifyListeners();
    }

    if (state == AudioPlaybackState.completed) {
      states = AudioPlayState.completed;
      print('completed');
      notifyListeners();
    }

//    print('state：${event.state}');
//    print('buffering：${event.buffering}');
  }

  //============================================================
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
    _player.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
