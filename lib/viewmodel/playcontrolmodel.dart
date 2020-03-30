import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:syhmusic/module/song.dart';
import 'package:syhmusic/viewmodel/cursongmodel.dart';
import 'package:syhmusic/viewmodel/playmanager.dart';
import 'package:syhmusic/viewmodel/spmodel.dart';

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
  bool cycle = false;
  bool shuffle = false;
  SpModel _sp;

  PlayControlModel() {
    _player = PlayManager.instance;
    _player.fullPlaybackStateStream.listen(onState);
    _sp = SpModel();
    //读取保存的播放控制状态
    updataplaystatus();
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
    if (_mcurpositon == _normalsonglist.length - 1 &&
        _normalsonglist.isNotEmpty) {
      _mcurpositon = 0;
    } else {
      _mcurpositon++;
    }
    if (shuffle) {
      cursong = _shufflesonglist[_mcurpositon];
    } else {
      cursong = _normalsonglist[_mcurpositon];
    }
    _player.setUrl(cursong.audiodownload);
    notifyListeners();
  }

  void playpre() {
    if (_mcurpositon > 0 && _normalsonglist.isNotEmpty) {
      _mcurpositon--;
    }
    if (shuffle) {
      cursong = _shufflesonglist[_mcurpositon];
    } else {
      cursong = _normalsonglist[_mcurpositon];
    }
    _player.setUrl(cursong.audiodownload);
    notifyListeners();
  }

  void onState(FullAudioPlaybackState event) {
    AudioPlaybackState state = event.state;
    bool buffering = event.buffering;

    if (state == AudioPlaybackState.connecting || buffering == true) {
      states = AudioPlayState.buffering;
      notifyListeners();
    }

    if (state == AudioPlaybackState.stopped && buffering == false) {
      _player.play();
      return;
    }

    if (state == AudioPlaybackState.playing) {
      states = AudioPlayState.playing;
      notifyListeners();
    }

    if (state == AudioPlaybackState.paused) {
      states = AudioPlayState.paused;
      notifyListeners();
    }

    if (state == AudioPlaybackState.completed) {
      states = AudioPlayState.completed;
      if (cycle) {
        _player.setUrl(cursong.audiodownload);
      } else {
        playnext();
      }
    }
  }

  void updataplaystatus() {
    _sp.getShuffle().then((value) => shuffle = value);
    _sp.getCycle().then((value) => cycle = value);
  }

//    print('state：${event.state}');
//    print('buffering：${event.buffering}');
//============================================================
  List<Results> _normalsonglist = new List();
  List<Results> _shufflesonglist = new List();
  int _mcurpositon;
  Results cursong;

  Results get getcursong => songlist.isNotEmpty ? cursong : null;

  List<Results> get songlist => _normalsonglist;

  void setCurListSong(List<Results> songlist, int position) {
    if (_normalsonglist.isEmpty || _normalsonglist.last != songlist.last) {
      _normalsonglist.clear();
      _normalsonglist.addAll(songlist);
      updateshufflesPlaylist(_normalsonglist);
      print("new list");
    }
    _mcurpositon = position;
    cursong = _normalsonglist[_mcurpositon];
    notifyListeners();
  }

  void updateshufflesPlaylist(List<Results> normalPlaylist) {
    _shufflesonglist = []..addAll(normalPlaylist);
    _shufflesonglist.shuffle();
  }

  @override
  void dispose() {
    _player.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
