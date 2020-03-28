import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:syhmusic/viewmodel/spmodel.dart';

class PreferencesBoard extends StatelessWidget {
  bool crcle = false;
  bool random = false;

  @override
  Widget build(BuildContext context) {
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
        Consumer(builder: (context, SpModel sp, _) {
          sp.getCycle().then((value) {
            print("Cycle$value");
            return IconButton(
              onPressed: () => sp.setCycle(!value),
              icon: Icon(
                Icons.loop,
                size: 35,
                color: !value ? Color(0xFFC7D2E3) : Color(0xFF7B92CA),
              ),
            );
          });
          return Icon(
            Icons.loop,
            size: 35,
            color: Color(0xFFC7D2E3),
          );
        }),
        Consumer(builder: (context, SpModel sp, _) {
          sp.getRandom().then((value) {
            print("getRandom$value");
            return IconButton(
              onPressed: () =>
                  sp.setRandom(!value).then((value) => sp.notifyListeners()),
              icon: Icon(
                Icons.shuffle,
                size: 35,
                color: !value ? Color(0xFFC7D2E3) : Color(0xFF7B92CA),
              ),
            );
          });
          return Icon(
            Icons.shuffle,
            size: 35,
            color: Color(0xFFC7D2E3),
          );
        }),
      ],
    );
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
