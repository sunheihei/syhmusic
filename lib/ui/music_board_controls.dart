import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:syhmusic/viewmodel/playcontrolmodel.dart';

class MusicBoardControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, PlayControlModel contorl, _) => Container(
        height: 100,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 245,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xFFDCE4F4),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 20,
                      offset: Offset(2, 1.5),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: GestureDetector(
                        onTap: (){
                          contorl.playpre();
                        },
                        child: Icon(
                          Icons.fast_rewind,
                          color: Color(0xFF7B92CA),
                          size: 40,
                        ),
                      ),
                    ),
                            Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: GestureDetector(
                          onTap: (){
                            contorl.playnext();
                          },
                          child: Icon(
                            Icons.fast_forward,
                          color: Color(0xFF7B92CA),
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  if (contorl.states == AudioPlayState.playing) {
                    contorl.pause();
                  } else {
                    contorl.play();
                  }
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 30,
                        offset: Offset(2, 1.5),
                      ),
                    ],
                  ),
                  child: Center(
                    child: AnimatedCrossFade(
                      duration: Duration(milliseconds: 200),
                      crossFadeState: contorl.states == AudioPlayState.playing
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      firstChild: Icon(
                        Icons.pause,
                        size: 50,
                        color: Color(0xFF7B92CA),
                      ),
                      secondChild: Icon(
                        Icons.play_arrow,
                        size: 50,
                        color: Color(0xFF7B92CA),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
