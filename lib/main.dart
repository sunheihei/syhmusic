import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:syhmusic/bottombar.dart';
import 'package:syhmusic/homemusic.dart';
import 'package:syhmusic/viewmodel/durationmodel.dart';
import 'package:syhmusic/viewmodel/playcontrolmodel.dart';
import 'package:syhmusic/viewmodel/playmanager.dart';

import 'drawerdemo.dart';
import 'player.dart';
import 'viewmodel/cursongmodel.dart';

//final curmusic = cursongmodel();
//final playstate = playcontrolmodel();



void main() {
  runApp(MultiProvider(
//    providers: [ChangeNotifierProvider.value(value: curmusic)],
    providers: [
      ChangeNotifierProvider(create: (_) => CursongModel()),
      Provider(create: (_) => AudioPlayer()),
//      ChangeNotifierProvider(create: (_) => PlayControlModel()),
//      ChangeNotifierProvider(create: (_) => DurtionModel()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'syhmusic',
        home: SafeArea(child: HomePagers()));
  }
}

class HomePagers extends StatefulWidget {
  @override
  _HomePagersState createState() => _HomePagersState();
}

class _HomePagersState extends State<HomePagers> {
  PanelController _panelController;
  final double _radius = 25.0;

  @override
  void initState() {
    _panelController = PanelController();
    super.initState();
  }

  @override
  void dispose() {
    _panelController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          if (!_panelController.isPanelClosed) {
            _panelController.close();
          } else {}
          return Future<bool>.value(false);
        },
        child: Scaffold(
          body: SlidingUpPanel(
            panel: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_radius),
                topRight: Radius.circular(_radius),
              ),
              child: player(controller: _panelController),
            ),
            controller: _panelController,
            minHeight: 100,
            maxHeight: MediaQuery.of(context).size.height,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(_radius),
              topRight: Radius.circular(_radius),
            ),
            collapsed: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_radius),
                  topRight: Radius.circular(_radius),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                    0.0,
                    0.7,
                  ],
                  colors: [
                    Color(0xFF47ACE1),
                    Color(0xFFDF5F9D),
                  ],
                ),
              ),
              child: GestureDetector(
                  child: bottombar(controller: _panelController),
                  onTap: () => _panelController.open()),
            ),
            body: DefaultTabController(
              length: 3,
              initialIndex: 0,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  automaticallyImplyLeading: false,
                  title: Text(
                    "SymMusic",
                    style: TextStyle(
                      color: Color(0xFF274D85),
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  bottom: TabBar(
                    indicatorColor: Color(0xFFD9EAF1),
                    labelColor: Color(0xFF274D85),
                    unselectedLabelColor: Color(0xFF274D85).withOpacity(0.6),
                    indicatorWeight: 1.0,
                    tabs: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "HOT",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "NEW",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "POP",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 35,
                        color: Color(0xFF274D85),
                      ),
                      tooltip: 'Search',
                      onPressed: () => debugPrint('search button is pressed'),
                    )
                  ],
                ),
                body: TabBarView(
                  key: UniqueKey(),
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[HomeMusic(0), HomeMusic(1), HomeMusic(2)],
                ),
              ),
            ),
          ),
        ));
  }
}

//class HomePager extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return DefaultTabController(
//      length: 3,
//      child: Scaffold(
////          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
////          floatingActionButton: FloatingActionButton(
////            onPressed: () => Navigator.of(context)
////                .push(MaterialPageRoute(builder: (context) => SecondPage())),
////            child: Icon(Icons.file_download),
////          ),
//          drawer: DrawerDemo(),
//          appBar: AppBar(
//            title: Text("SyhMusic"),
//            elevation: 4.0,
//            actions: <Widget>[
//              IconButton(
//                icon: Icon(
//                  Icons.search,
//                ),
//                tooltip: 'Search',
//                onPressed: () => debugPrint('search button is pressed'),
//              )
//            ],
//            bottom: TabBar(
//              indicatorColor: Color(0xFFD9EAF1),
//              labelColor: Color(0xFF274D85),
//              unselectedLabelColor: Color(0xFF274D85).withOpacity(0.6),
//              indicatorWeight: 1.0,
//              tabs: <Widget>[
//                Tab(
//                  text: 'HOT SONGS',
//                ),
//                Tab(
//                  text: 'NEW SONGS',
//                ),
//                Tab(
//                  text: 'POP SONGS',
//                ),
//              ],
//            ),
//          ),
//          body: Stack(
//            alignment: Alignment.bottomCenter,
//            children: <Widget>[
//              TabBarView(
//                children: <Widget>[HomeMusic(0), HomeMusic(1), HomeMusic(2)],
//              ),
//              Positioned(
//                child: GestureDetector(
//                  child: bottombar(),
//                  onTap: () => Navigator.of(context)
//                      .push(MaterialPageRoute(builder: (context) => player())),
//                ),
//              )
//            ],
//          )),
//    );
//  }
//}
