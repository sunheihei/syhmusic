import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syhmusic/view/DialogView.dart';
import 'package:syhmusic/view/listitemview.dart';
import 'package:syhmusic/viewmodel/playcontrolmodel.dart';

import 'db/songdbprovider.dart';
import 'module/song.dart';
import 'viewmodel/dbmodel.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  StreamController<List<Results>> _streamController;
  List<Results> _Favlist;

  @override
  void initState() {
    _streamController = StreamController();
    _getFavSong();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }

  void _getFavSong() async {
    SongDbProvider db = new SongDbProvider();
    _streamController.sink.add(await db.getFavSongList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder(
          stream: _streamController.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    "No Favroite Songs",
                    style: TextStyle(fontSize: 24, color: Color(0xFF274D85)),
                  ),
                ),
              );
            }

            return buildListView(context, snapshot.data);
          },
        ),
      ),
    );
  }

  Widget buildListView(BuildContext context, List<Results> list) {
    _Favlist = list;
    return ListView.builder(
      itemBuilder: (context, index) {
        Results bean = list[index];
        return Consumer2(
            builder: (context, PlayControlModel control, DBModel db, _) =>
                GestureDetector(
                  onTap: () {
                    debugPrint("fav click");
                    control.setCurListSong(list, index);
                    control.seturl(bean.audiodownload);
                  },
                  child: ListItemView(2, bean),
                )
            );
      },
      itemCount: list.length,
    );
  }
}
