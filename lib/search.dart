import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syhmusic/unusedui/baseappbar.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

//https://api.jamendo.com/v3.0/tracks?format=json&include=lyrics&limit=70&search=abc&type=single+albumtrack&client_id=16c28430&order=downloads_total&offset=0

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseViewBar(
        preferredSize: Size.fromHeight(65),
        childView: Searchbar(),
      ),
      body: Container(),
    );
  }
}

class Searchbar extends StatefulWidget {
  @override
  _SearchbarState createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  final searchEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
//            IconButton(
//              iconSize: 35,
//              icon: Icon(
//                Icons.arrow_back,
//                color: Color(0xFF274D85),
//              ),
//              onPressed: () => Navigator.pop(context),
//            ),
            Expanded(
              child: Container(
                  margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                  decoration: new BoxDecoration(
                    border: Border.all(color: Colors.black12, width: 2.0),
                    //灰色的一层边框
                    color: Colors.white,
                    borderRadius:
                    new BorderRadius.all(new Radius.circular(15.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(6.0, 0.0, 12.0, 0.0),
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: new EdgeInsets.only(left: 0.0),
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          hintStyle:
                          new TextStyle(fontSize: 14, color: Colors.white),
                          icon: Icon(Icons.search,size: 35,)
                      ),
                      style: new TextStyle(
                          fontSize: 22, color: Color(0xFF274D85)),
                      controller: searchEditingController,
                    ),
                  )),
            ),
            IconButton(
                iconSize: 35,
                icon: Icon(
                  Icons.search,
                  color: Color(0xFF274D85),
                ),
                onPressed: null),
          ],
        ));
  }
}
