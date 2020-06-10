import 'package:flutter/material.dart';

class DeleteConfirmDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("提示"),
      content: Text("您确定要删除当前文件吗?"),
      actions: <Widget>[
        FlatButton(
          child: Text("取消"),
          onPressed: () => Navigator.of(context).pop(), // 关闭对话框
        ),
        FlatButton(
          child: Text("删除"),
          onPressed: () {
            //关闭对话框并返回true
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}


