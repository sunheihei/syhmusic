import 'package:sqflite/sqlite_api.dart';
import 'package:syhmusic/module/song.dart';

import 'dbprovider.dart';

class SongDbProvider extends BaseDbProvider {
  ///表名
  final String name = 'FavSongInfo';

  final String columnsongid = "id";
  final String columnname = "name";
  final String columnduration = "duration";
  final String columnartist_name = "artist_name";
  final String columnalbum_name = "album_name";
  final String columnalbum_id = "album_id";
  final String columnlicense_ccurl = "license_ccurl";
  final String columnalbum_image = "album_image";
  final String columnaudio = "audio";
  final String columnaudiodownload = "audiodownload";

  @override
  createTableString() {
    // TODO: implement createTableString
    return '''
        create table $name (
        $columnsongid text PRIMARY KEY,
        $columnname text,
        $columnduration integer,
        $columnartist_name text,
        $columnalbum_name text,
        $columnalbum_id text,
        $columnlicense_ccurl text,
        $columnalbum_image text,
        $columnaudio text,
        $columnaudiodownload text)
      ''';
  }

  @override
  tableName() {
    // TODO: implement tableName
    return name;
  }

  Map<String, dynamic> toMap(Results song) {
    Map<String, dynamic> map = {
      columnsongid: song.songid,
      columnname: song.name,
      columnduration: song.duration,
      columnartist_name: song.artistName,
      columnalbum_name: song.albumName,
      columnalbum_id: song.albumId,
      columnlicense_ccurl: song.licenseCcurl,
      columnalbum_image: song.albumImage,
      columnaudio: song.audio,
      columnaudiodownload: song.audiodownload,
    };
    return map;
  }

  ///查询数据库
//  Future getPersonProvider(Database db, String songid) async {
//    List<Map<String, dynamic>> list =
//        await db.rawQuery("select * from $name where $columnsongid = $songid");
//    return list;
//  }

  Future getCurSongProvider(Database db, String songid) async {
    List<Map<String, dynamic>> list =
        await db.rawQuery("select * from $name where $columnsongid = $songid");
    return list;
  }

  ///插入到数据库
  Future<int> insert(Database db ,Results song) async {
    return await db.insert(name, toMap(song));
  }

  Future delete(Database db,Results song) async {
    await db.delete(name, where: "$columnsongid = ?", whereArgs: [song.songid]);
  }

  Future<List<Results>> getFavSongList() async {
    Database db = await getDataBase();
    List<Map<String, dynamic>> maps = await db.query(name);
    maps[0].forEach((String key,dynamic value){
      print("$key  $value");
    });
    if (maps.length > 0) {
      List<Results> favsonglist =
          maps.map((item) => Results.fromJson(item)).toList();
      return favsonglist;
    }
    return null;
  }
}
