import 'package:flutter/material.dart';
import 'package:syhmusic/module/song.dart';

import 'DialogView.dart';

class ListItemView extends StatelessWidget {
  Results _bean;
  int _type; //区分使用场景
  /**
   * 0 home
   * 1 search
   * 2 favroite
   */
  ListItemView(this._type, this._bean);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Image.network(_bean.albumImage),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      _bean.albumName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xFF274D85),
                        fontSize: 24.0,
                      ),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      _bean.artistName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF274D85),
                      ),
                    )
                  ],
                ),
              )),
              IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Color(0xFF274D85),
                  size: 32,
                ),
                onPressed: null,
//                   dialog test
//                  onPressed: () async {
//                    print("onPressed");
//                    if (_type == 2) {
//                      bool delete = await showDeleteConfirmDialog(context);
//                      if (delete) {
//                        print("$delete");
//                      }
//                    }
//                  }
              )
            ],
          ),
        ));
  }
}

Future<bool> showDeleteConfirmDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return DeleteConfirmDialog();
    },
  );
}
