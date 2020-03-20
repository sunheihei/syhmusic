import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syhmusic/bottombar.dart';
import 'package:syhmusic/homemusic.dart';

import 'drawerdemo.dart';
import 'player.dart';
import 'viewmodel/cursongmodel.dart';

final curmusic = cursongmodel();

void main() {
  runApp(MultiProvider(
//    providers: [ChangeNotifierProvider.value(value: curmusic)],
    providers: [
      ChangeNotifierProvider(create: (_) => cursongmodel()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'syhmusic',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePager());
  }
}

class HomePager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
//          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//          floatingActionButton: FloatingActionButton(
//            onPressed: () => Navigator.of(context)
//                .push(MaterialPageRoute(builder: (context) => SecondPage())),
//            child: Icon(Icons.file_download),
//          ),
          drawer: DrawerDemo(),
          appBar: AppBar(
            title: Text("SyhMusic"),
            elevation: 4.0,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                ),
                tooltip: 'Search',
                onPressed: () => debugPrint('search button is pressed'),
              )
            ],
            bottom: TabBar(
              unselectedLabelColor: Colors.black26,
              indicatorColor: Colors.black54,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 1.0,
              tabs: <Widget>[
                Tab(
                  text: 'HOT SONGS',
                ),
                Tab(
                  text: 'NEW SONGS',
                ),
                Tab(
                  text: 'POP SONGS',
                ),
              ],
            ),
          ),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              TabBarView(
                children: <Widget>[HomeMusic(0), HomeMusic(1), HomeMusic(2)],
              ),
              Positioned(
                child: GestureDetector(
                  child: bottombar(),
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => player())),
                ),
              )
            ],
          )),
    );
  }
}
