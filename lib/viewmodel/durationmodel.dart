import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:syhmusic/viewmodel/playmanager.dart';


class DurtionModel with ChangeNotifier {
  AudioPlayer _player;
  playcontrolmodel() {
    _player = PlayManager.instance;
//    _player.fullPlaybackStateStream.listen(onState);
    _player.durationStream.listen(onDuration);
    _player.getPositionStream().listen(onPositon);
  }

//  void SetUrl(String url) {
//    _player.setUrl(url);
//  }
//
//  void onState(FullAudioPlaybackState event) {
//    AudioPlaybackState state = event.state;
//    bool buffering = event.buffering;
//    print('${event.state}');
//    print('${event.buffering}');
//
//    if (state == AudioPlaybackState.connecting || buffering == true) {
//
//    }
//  }

  void onDuration(Duration event) {
    print('onDuration :${event.inMinutes}');
    print('onDuration :${event.inSeconds}');
  }

  void onPositon(Duration event) {
    print('onPositon:${event.inMilliseconds}');
  }
}