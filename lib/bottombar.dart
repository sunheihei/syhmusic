import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syhmusic/viewmodel/cursongmodel.dart';

class bottombar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomState();
  }
}

class BottomState extends State<bottombar> {

  bool mcursong = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 64,
        color: Colors.white,
        child: Consumer<cursongmodel>(
            builder: (context, cursongmodel cursong, _) {
              if (cursong.value != null) {
                mcursong = true;
              }
              return Container(
                height: 56,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                        mcursong ? cursong.value.albumImage : "dsadasdasd"),
                    Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                mcursong
                                    ? cursong.value.albumName
                                    : "Song name",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 24.0,),
                              ),
                              SizedBox(
                                height: 6.0,
                              ),
                              Text(
                                mcursong ? cursong.value.artistName
                                    : "Song singer",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 12.0),
                              )
                            ],
                          ),
                        )),
                    IconButton(
                      icon: Icon(Icons.play_circle_outline),
                      onPressed: null,
                      iconSize: 42,
                    )
                  ],
                ),
              );
            }
//        builder: (context,CurSongModel cursong, _)=>Text(
//            cursong.value.albumName.toString()
//        )
        ));
  }
}
