import 'package:just_audio/just_audio.dart';

class PlayManager {

  static AudioPlayer get instance => _getInstance();

  static AudioPlayer _instance;

  static AudioPlayer _getInstance() {
    if (_instance == null) {
      _instance =  AudioPlayer();
    }
    return _instance;
  }
}