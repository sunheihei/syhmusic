import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                Dismissible(
                  key: Key(UniqueKey().toString()),
                  onDismissed: (direction) {
//                    _Favlist.removeAt(index);
//                    //删除数据库当前数据
                    db.deleteFavNoReFresh(bean);
                    //刷新当前列表展示
                  },
                  background: Container(
                      color: Colors.red,
                      child: Center(
                        child: ListTile(
                          trailing: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          leading: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      )),
                  child: GestureDetector(
                    onLongPress: (){
                      showDeleteConfirmDialog1(context);
                    },
                    onTap: () {
                      control.setCurListSong(list, index);
                      control.seturl(bean.audiodownload);
                    },
                    child: ListItemView(2,bean),
                  ),
                ));
      },
      itemCount: list.length,
    );
  }
}

Future<bool> showDeleteConfirmDialog1(BuildContext context) {
  return showDialog<bool>(context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Text("您确定要删除当前文件吗?"),
        actions: <Widget>[
          FlatButton(
            child: Text("取消"),
            onPressed: () => Navigator.of(context).pop(), // 关闭对话框
          ),
          FlatButton(
            child: Text("删除"),
            onPressed: () {
              //关闭对话框并返回true
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}
