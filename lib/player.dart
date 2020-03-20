import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syhmusic/view/baseappbar.dart';
import 'package:syhmusic/view/playappbar.dart';
import 'package:syhmusic/viewmodel/cursongmodel.dart';

class player extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseViewBar(
        childView: playappbar(),
        preferredSize: Size.fromHeight(60),
      ),
      body: PlayerMain(),
    );
  }
}

class PlayerMain extends StatefulWidget {
  @override
  _PlayerMainState createState() => _PlayerMainState();
}

class _PlayerMainState extends State<PlayerMain> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Center(
            child: Consumer<cursongmodel>(
              builder: (context, cursongmodel cursong, _) {
                return Container(
                  child: ClipOval(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.network(
                      cursong.value != null ? cursong.value.albumImage : "null",
                      height: 300,
                      width: 300,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
          ),
          flex: 3,
        ),
       Container(height: 1,color: Colors.black26,),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(width: 20),
              IconButton(icon: Icon(Icons.replay), onPressed: null, iconSize: 30),
              IconButton(icon: Icon(Icons.skip_previous), onPressed: null, iconSize: 60),
              IconButton(icon: Icon(Icons.play_circle_outline), onPressed: null, iconSize: 60),
              IconButton(icon: Icon(Icons.skip_next), onPressed: null, iconSize: 60),
              IconButton(icon: Icon(Icons.favorite_border), onPressed: null, iconSize: 30),
              SizedBox(width: 20),
            ],
          ),
          flex: 1,
        ),
      ],
    );
  }
}
