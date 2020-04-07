import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    // 这里不要忘了将监听移除
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
            _Favlist = snapshot.data;
            return buildListView(context, _Favlist);
          },
        ),
      ),
    );
  }

  Widget buildListView(BuildContext context, List<Results> list) {
    return ListView.builder(
      itemBuilder: (context, index) {
//        if (index == list.length) {
//          return Container(
//            color: Colors.white,
//            padding: const EdgeInsets.all(16.0),
//            alignment: Alignment.center,
//            child: SizedBox(
//                width: 24.0,
//                height: 24.0,
//                child: isNoMore
//                    ? Text("Nomore")
//                    : CircularProgressIndicator(strokeWidth: 2.0)),
//          );
//        }
        Results bean = list[index];
        return Consumer2(
            builder: (context, PlayControlModel control, DBModel db, _) =>
                Dismissible(
                  key: Key('key${index}'),
                  onDismissed: (direction) {
                    //删除数据库当前数据
                    db.deleteFav(bean);
                    //刷新当前列表展示
                    setState(() {
                      _Favlist.removeAt(index);
                    });
                  },
                  background: Container(
                      color: Colors.red,
                      // 这里使用 ListTile 因为可以快速设置左右两端的Icon
                      child: Center(
                        child: ListTile(
                          leading: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      )),
                  child: GestureDetector(
                    onTap: () {
                      control.setCurListSong(list, index);
                      control.seturl(bean.audiodownload);
                    },
                    child: Container(
                        height: 80,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                child: Image.network(bean.albumImage),
                              ),
                              Expanded(
                                  child: Container(
                                margin: EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      bean.albumName,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Color(0xFF274D85),
                                        fontSize: 24.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6.0,
                                    ),
                                    Text(
                                      bean.artistName,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color(0xFF274D85),
                                      ),
                                    )
                                  ],
                                ),
                              )),
//                            IconButton(
//                                icon: Icon(
//                                  Icons.favorite,
//                                  color: Color(0xFF274D85),
//                                  size: 32,
//                                ),
//                                onPressed: null)
                            ],
                          ),
                        )),
                  ),
                ));
      },
      itemCount: list.length,
    );
  }
}
