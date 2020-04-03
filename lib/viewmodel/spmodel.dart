import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpModel with ChangeNotifier {
  final String TAG_CYCLE = "cycle";
  final String TAG_RANDOM = "random";

  bool cycle = false;
  bool shuffle = false;

  StreamController<bool> cyclestreamController;
  StreamController<bool> shufflestreamController;

  SpModel() {
    cyclestreamController = StreamController.broadcast();
    shufflestreamController = StreamController.broadcast();
    //启动时读取保存的播放控制状态
    updataplaystatus();
  }

  void updataplaystatus() {
    getShuffle().then((value) => shuffle = value);
    getCycle().then((value) => cycle = value);
  }

  Future<void> updatacycle() async {
    cyclestreamController.add(await getCycle());
  }

  Future<void> updataradom() async {
    shufflestreamController.add(await getShuffle());
  }

  Future<void> setCycle(bool cycle) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(TAG_CYCLE, cycle);
    this.cycle = cycle;
    updatacycle();
  }

  Future<bool> getCycle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(TAG_CYCLE) ?? false;
  }

  Future<void> setShuffle(bool shuffle) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(TAG_RANDOM, shuffle);
    this.shuffle = shuffle;
    updataradom();
  }

  Future<bool> getShuffle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(TAG_RANDOM) ?? false;
  }
}
