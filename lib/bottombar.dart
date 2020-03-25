import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:syhmusic/viewmodel/cursongmodel.dart';

class bottombar extends StatefulWidget {
  final PanelController _controller;

  bottombar({@required PanelController controller}) : _controller = controller;

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
        height: double.infinity,
        child:
            Consumer<CursongModel>(builder: (context, CursongModel cursong, _) {
          if (cursong.getcursong != null) {
              mcursong = true;
          }
          return Container(
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                  ),
                  child: Image.network(
                      mcursong ? cursong.getcursong.albumImage : "dsadasdasd"),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        mcursong ? cursong.getcursong.albumName : "Song name",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                        ),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        mcursong ? cursong.getcursong.artistName : "Song singer",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )),
                IconButton(
                  icon: Icon(
                    Icons.play_circle_outline,
                    color: Colors.white,
                  ),
                  onPressed: null,
                  iconSize: 60,
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
