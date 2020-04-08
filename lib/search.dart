import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

//https://api.jamendo.com/v3.0/tracks?format=json&include=lyrics&limit=70&search=abc&type=single+albumtrack&client_id=16c28430&order=downloads_total&offset=0

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[SearchInputText()],
        ),
      ),
    );
  }
}

class SearchInputText extends StatefulWidget {
  @override
  _SearchInputTextState createState() => _SearchInputTextState();
}

class _SearchInputTextState extends State<SearchInputText> {
  final searchEditingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    searchEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 12.0),
        decoration: new BoxDecoration(
          border: Border.all(color: Colors.black12, width: 2.0),
          //灰色的一层边框
          color: Colors.white,
          borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
          child: TextField(
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
                contentPadding: new EdgeInsets.only(left: 0.0),
                fillColor: Colors.white,
                border: InputBorder.none,
                hintStyle: new TextStyle(fontSize: 18, color: Colors.white),
                icon: Icon(
                  Icons.search,
                  size: 35,
                )),
            onSubmitted: (value) {
              debugPrint('submit: $value');
            },
            style: new TextStyle(fontSize: 22, color: Color(0xFF274D85)),
            controller: searchEditingController,
          ),
        ));
  }
}
