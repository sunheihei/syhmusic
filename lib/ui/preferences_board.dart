import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syhmusic/viewmodel/spmodel.dart';

class PreferencesBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {




    return Consumer(builder: (context, SpModel sp, _) {



      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.favorite,
              size: 35,
              color: !false ? Color(0xFFC7D2E3) : Color(0xFF7B92CA),
            ),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.loop,
              size: 35,
              color: !false ? Color(0xFFC7D2E3) : Color(0xFF7B92CA),
            ),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.shuffle,
              size: 35,
              color: !false ? Color(0xFFC7D2E3) : Color(0xFF7B92CA),
            ),
          ),
        ],
      );
    });
  }
}
//sp.getCycle().then((value) {
//        crcle = value;
//        print("crcle:$crcle");
//      });
//      sp.getRandom().then((value){
//        random = value;
//        print("random$random");
//      });
