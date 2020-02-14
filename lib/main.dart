import 'package:flutter/material.dart';
import 'package:syhmusic/bottombar.dart';
import 'package:syhmusic/homemusic.dart';
import 'drawerdemo.dart';

void main() => runApp(MyApp());

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
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: FloatingActionButton(
          onPressed: () => debugPrint('local button is pressed'),
          child: Icon(Icons.file_download),
        ),
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
        body:  Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            TabBarView(
              children: <Widget>[HomeMusic(0), HomeMusic(1), HomeMusic(2)],
            ),
            Positioned(
              child: bottombar() ,
            )
          ],
        )
      ),
    );
  }
}
