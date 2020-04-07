import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpModel with ChangeNotifier {
  final String TAG_CYCLE = "cycle";
  final String TAG_SHUFFLE = "shuffle";

  bool cycle = false;
  bool shuffle = false;

  StreamController<bool> cyclestreamController;
  StreamController<bool> shufflestreamController;

  SpModel() {
    //启动时读取保存的播放控制状态
    updataplaystatus();
  }

  void updataplaystatus() {
    getCycle().then((value) => cycle = value);
    getShuffle().then((value) => shuffle = value);
  }

  Future<void> updatacycle() async {
    getCycle().then((value){
      cycle = value;
      notifyListeners();
    });
  }

  Future<void> updataradom() async {
    getShuffle().then((value){
      shuffle = value;
      notifyListeners();
    });
  }

  Future<void> setCycle(bool cycle) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(TAG_CYCLE, cycle);
    this.cycle = cycle;
    notifyListeners();
  }

  Future<bool> getCycle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(TAG_CYCLE) ?? false;
  }

  Future<void> setShuffle(bool shuffle) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(TAG_SHUFFLE, shuffle);
    this.shuffle = shuffle;
    notifyListeners();
  }

  Future<bool> getShuffle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(TAG_SHUFFLE) ?? false;
  }
}
