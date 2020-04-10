import 'dart:async';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:syhmusic/view/listitemview.dart';
import 'package:syhmusic/viewmodel/playcontrolmodel.dart';
import 'module/song.dart';

Dio dio = Dio();

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool _IsSearch = false;
  bool _Isloading = false;
  bool _HasSearchString = false;
  final searchEditingController = TextEditingController();
  StreamController<List<Results>> _streamController;

//  @override
//  bool get wantKeepAlive => true;

  @override
  void initState() {
    _streamController = StreamController.broadcast();

    searchEditingController.addListener(() {
      setState(() {
        if (searchEditingController.text.length == 0) {
          _HasSearchString = false;
        } else {
          _HasSearchString = true;
        }
      });
//      print("_HasSearchString :${_HasSearchString}");
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    searchEditingController.dispose();
    super.dispose();
  }

  void _addDataToStream(String searchkey) async {
    print('Add data to stream.');
    _streamController.sink.add(await getSearchData(searchkey));
  }

  Future<List<Results>> getSearchData(String searchkey) async {
    String url =
        "https://api.jamendo.com/v3.0/tracks?format=json&include=lyrics&limit=70&search=${searchkey}&type=single+albumtrack&client_id=16c28430&order=downloads_total&offset=0";
    Response response = await dio.get(url);
    Song song = Song.fromJson(response.data);
    _Isloading = false;
    return song.results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SearchInputText(),
            Expanded(
              child: SearchResult(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget SearchResult(BuildContext context) {
    return StreamBuilder(
      stream: _streamController.stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData || _Isloading) {
          if (_IsSearch) {
            return Container(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Container(
              child: Text('no search'),
            );
          }
        }
        return buildListView(context, snapshot.data);
      },
    );
  }

  Widget buildListView(BuildContext context, List<Results> list) {
    return ListView.builder(
      itemBuilder: (context, index) {
        Results bean = list[index];
        return Consumer(
            builder: (context, PlayControlModel control, _) => GestureDetector(
                onTap: () {
                  control.setCurListSong(list, index);
                  control.seturl(bean.audiodownload);
                },
                child: ListItemView(bean)));
      },
      itemCount: list.length,
    );
  }

  Widget SearchInputText() {
    return Container(
        margin: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 12.0),
        decoration: new BoxDecoration(
          border: Border.all(color: Colors.black12, width: 2.0),
          //灰色的一层边框
          color: Colors.white,
          borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
                child: TextField(
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                      contentPadding: new EdgeInsets.only(left: 0.0),
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintStyle:
                          new TextStyle(fontSize: 18, color: Colors.white),
                      icon: Icon(
                        Icons.search,
                        size: 35,
                      )),
                  onSubmitted: (value) {
                    _IsSearch = true;
                    _Isloading = true;
                    _addDataToStream(value);
                  },
                  maxLines: 1,
                  style: new TextStyle(fontSize: 22, color: Color(0xFF274D85)),
                  controller: searchEditingController,
                ),
              ),
            ),
            Offstage(
              offstage: !_HasSearchString,
              child: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      searchEditingController.clear();
                    });
                  }),
            )
          ],
        ));
  }
}
