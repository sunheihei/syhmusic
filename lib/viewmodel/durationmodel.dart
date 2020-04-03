import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:syhmusic/playmanager.dart';

class DurtionModel with ChangeNotifier {

  AudioPlayer _player;
  Duration duration;
  Duration position;

  DurtionModel() {
    _player = PlayManager.instance;
    _player.durationStream.listen(onDuration);
    _player.getPositionStream().listen(onPositon);
  }

  void onDuration(Duration event) {
    print('onDuration :${event}');
    duration = event;
    notifyListeners();
  }

  void onPositon(Duration event) {
    position = event;
    notifyListeners();
  }

  @override
  void dispose() {
    _player.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
