import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:syhmusic/module/song.dart';

import 'Viewmodel/CurSongModel.dart';

Dio dio = Dio();

class HomeMusic extends StatefulWidget {
  int type;

  HomeMusic(@required this.type);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeMusicState();
  }
}

class HomeMusicState extends State<HomeMusic>
    with AutomaticKeepAliveClientMixin {
  List<Results> songlist = new List();
  ScrollController _scrollController;
  StreamController<List<Results>> _streamController;
  bool isLoading = true;
  bool isNoMore = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamController = StreamController.broadcast();
    _streamController.stream.listen(onData);
    _addDataToStream();
  }

  void onData(List<Results> value) {
    setState(() {
      songlist.addAll(value);
    });
  }

  void _addDataToStream() async {
    print('Add data to stream.');
    _streamController.sink.add(await getData());
  }

  @override
  void dispose() {
    super.dispose();
    // 这里不要忘了将监听移除
    _scrollController.dispose();
    _streamController.close();
  }

  Future<List<Results>> getData() async {
    isLoading = true;
    String url = "";
    switch (widget.type) {
      case 0:
        url =
            "https://api.jamendo.com/v3.0/tracks?format=json&include=lyrics&limit=70&type=single+albumtrack&client_id=97dab294&order=popularity_total&offset=0";
        break;
      case 1:
        url =
            "https://api.jamendo.com/v3.0/tracks?format=json&include=lyrics&limit=70&type=single+albumtrack&client_id=97dab294&order=downloads_total&offset=0";
        break;
      case 2:
        url =
            "https://api.jamendo.com/v3.0/tracks?format=json&include=lyrics&limit=70&type=single+albumtrack&client_id=97dab294&order=listens_total&offset=0";
        break;
    }

    Response response = await dio.get(url);
    Song song = Song.fromJson(response.data);
    isLoading = false;
    return song.results;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder(
      stream: _streamController.stream,
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return buildListView(context, snapshot.data);
        }
      },
    );
  }

  Widget buildListView(BuildContext context, List<Results> list) {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index == list.length) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: SizedBox(
                width: 24.0,
                height: 24.0,
                child: isNoMore
                    ? Text("Nomore")
                    : CircularProgressIndicator(strokeWidth: 2.0)),
          );
        }
        Results bean = list[index];
        return Consumer<CurSongModel>(
            builder: (context, CurSongModel cursong, _) => ListTile(
                  title: Text(bean.albumName),
                  subtitle: Text(bean.artistName, maxLines: 1),
                  leading: new Image.network(bean.albumImage),
                  trailing: IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed:() { /* Your code */ },
                  ),
                  onTap: () {
                    cursong.setCurSong(bean);
                  },
                ));
      },
      itemCount: list.length + 1,
      controller: _scrollController,
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
