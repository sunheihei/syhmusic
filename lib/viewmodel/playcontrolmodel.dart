import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:syhmusic/viewmodel/cursongmodel.dart';
import 'package:syhmusic/viewmodel/playmanager.dart';


class PlayControlModel with ChangeNotifier {
  AudioPlayer _player;
  PlayControlModel() {
    _player = PlayManager.instance;
    _player.fullPlaybackStateStream.listen(onState);
//    _player.durationStream.listen(onDuration);
//    _player.getPositionStream().listen(onPositon);
  }

  void seturl(String url) {
    _player.setUrl(url);
  }

  void onState(FullAudioPlaybackState event) {
    AudioPlaybackState state = event.state;
    bool buffering = event.buffering;
    print('state：${event.state}');
    print('buffering：${event.buffering}');
  }

//  void onDuration(Duration event) {
//    print('onDuration :${event.inMinutes}');
//    print('onDuration :${event.inSeconds}');
//  }
//
//  void onPositon(Duration event) {
//    print('onPositon:${event.inMilliseconds}');
//  }
}
