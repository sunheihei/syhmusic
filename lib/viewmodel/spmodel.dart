import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpModel with ChangeNotifier {

  final String TAG_CYCLE = "cycle";
  final String TAG_RANDOM = "random";

   Future<void> setCycle(bool cycle) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(TAG_CYCLE, cycle);
  }

  Future<bool> getCycle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(TAG_CYCLE) ?? false;
  }

  Future<void> setRandom(bool random) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(TAG_RANDOM, random);
  }

  Future<bool> getRandom() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(TAG_RANDOM) ?? false;
  }
}
