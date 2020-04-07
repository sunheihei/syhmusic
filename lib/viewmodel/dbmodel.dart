import 'dart:async';
import 'package:sqflite/sqlite_api.dart';
import 'package:flutter/material.dart';
import 'package:syhmusic/db/songdbprovider.dart';
import 'package:syhmusic/module/song.dart';

class DBModel extends ChangeNotifier {
  StreamController favstreamController;
  SongDbProvider _dbProvider;

  DBModel() {
    _dbProvider = SongDbProvider();
    favstreamController = StreamController();
  }

  Future<void> updataFav(String songid) async {
    favstreamController.add(await isFav(songid));
  }

  //判断是否已经保存
  Future<bool> isFav(String songid) async {
    Database db = await _dbProvider.getDataBase();
    List songlist = await _dbProvider.getCurSongProvider(db, songid);
    if (songlist.length != 0) {
      return true;
    }
    return false;
  }

  Future saveFav(Results song) async {
//    favstreamController.add(true);
    Database db = await _dbProvider.getDataBase();
    _dbProvider.insert(db, song).then((value) => notifyListeners());
  }

  Future deleteFav(Results song) async {
//    favstreamController.add(false);
    Database db = await _dbProvider.getDataBase();
    _dbProvider.delete(db, song).then((value) => notifyListeners());
  }
}
