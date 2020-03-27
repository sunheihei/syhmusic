import 'package:flutter/cupertino.dart';

class BaseViewBar extends PreferredSize {
  Widget childView;
  @override
  final Size preferredSize;

  BaseViewBar({this.preferredSize, this.childView});

  @override
  Widget build(BuildContext context) {
    Widget current = childView;
    return SafeArea(
      child: current,
    );
  }
}
