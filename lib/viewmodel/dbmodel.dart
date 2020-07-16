import 'dart:async';
import 'package:sqflite/sqlite_api.dart';
import 'package:flutter/material.dart';
import 'package:syhmusic/db/songdbprovider.dart';
import 'package:syhmusic/module/song.dart';

class DBModel extends ChangeNotifier {
  SongDbProvider _dbProvider;
  bool mIsFav = false;

  DBModel() {
    _dbProvider = SongDbProvider();
  }

  Future<void> updataFav(String songid) async {
    isFav(songid).then((value) {
      mIsFav = value;
      notifyListeners();
    });
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
    Database db = await _dbProvider.getDataBase();
    _dbProvider.insert(db, song).then((value) {
      mIsFav = true;
      notifyListeners();
    });
  }

  Future deleteFav(Results song) async {
    Database db = await _dbProvider.getDataBase();
    _dbProvider.delete(db, song).then((value) {
      mIsFav = false;
      notifyListeners();
    });
  }

  Future deleteFavNoReFresh(Results song) async {
    Database db = await _dbProvider.getDataBase();
    _dbProvider.delete(db, song).then((value) {});
  }
}
