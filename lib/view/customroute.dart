import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder {
  final Widget widget;

  CustomRoute(this.widget)
      : super(
            transitionDuration: Duration(milliseconds: 800),
            pageBuilder: (BuildContext context, Animation<double> animation1,
                Animation<double> animation2) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
              return  RotationTransition(
                  turns:Tween(begin:0.0,end:1.0)
                      .animate(CurvedAnimation(
                      parent: animation1,
                      curve: Curves.fastOutSlowIn
                  )),
                  child:ScaleTransition(
                    scale:Tween(begin: 0.0,end:1.0)
                        .animate(CurvedAnimation(
                        parent: animation1,
                        curve:Curves.fastOutSlowIn
                    )),
                    child: child,
                  )
              );
//                SlideTransition(
//                position: Tween<Offset>(
//                    begin: Offset(-1.0, 0.0),
//                    end:Offset(0.0, 0.0)
//                )
//                    .animate(CurvedAnimation(
//                    parent: animation1,
//                    curve: Curves.fastOutSlowIn
//                )),
//                child: child,
//              );
//                FadeTransition(
//                opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//                    parent: animation1, curve: Curves.fastOutSlowIn)),
//                child: child,
//              );
            });
}
