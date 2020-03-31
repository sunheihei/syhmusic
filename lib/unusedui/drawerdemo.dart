import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
//            accountName: Text(
//              'Sun',
//              style: TextStyle(fontWeight: FontWeight.bold),
//            ),
//            accountEmail: Text('sunyihuan0@gmail.com'),
//            currentAccountPicture: CircleAvatar(
//              backgroundImage: NetworkImage(""),
//            ),
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                image: DecorationImage(
                    image: NetworkImage(''),
                    fit: BoxFit.cover, //图像展示模式
                    colorFilter: ColorFilter.mode(
                        Colors.yellow.withOpacity(0.6),
                        BlendMode.srcOver))), //图像滤镜
          ),
//              DrawerHeader(
//                child: Text('header'.toUpperCase()),
//                decoration: BoxDecoration(color: Colors.grey),
//              ),
          ListTile(
            onTap: () => Navigator.pop(context),
            title: Text(
              'LocalMusic',
              textAlign: TextAlign.start,
            ),
            leading: Icon(
              Icons.message,
              color: Colors.black12,
              size: 22.0,
            ),
          ),
          ListTile(
            onTap: () => Navigator.pop(context),
            title: Text(
              'Rating',
              textAlign: TextAlign.start,
            ),
            leading: Icon(
              Icons.favorite,
              color: Colors.black12,
              size: 22.0,
            ),
          ),
          ListTile(
            onTap: () => Navigator.pop(context),
            title: Text(
              'Settings',
              textAlign: TextAlign.start,
            ),
            leading: Icon(
              Icons.settings,
              color: Colors.black12,
              size: 22.0,
            ),
          ),
          ListTile(
            onTap: () => Navigator.pop(context),
            title: Text(
              'Stop play regularly',
              textAlign: TextAlign.start,
            ),
            leading: Icon(
              Icons.alarm,
              color: Colors.black12,
              size: 22.0,
            ),
          ),
          ListTile(
            onTap: () => Navigator.pop(context),
            title: Text(
              'Exit the App',
              textAlign: TextAlign.start,
            ),
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.black12,
              size: 22.0,
            ),
          ),
        ],
      ),
    );
  }
}
