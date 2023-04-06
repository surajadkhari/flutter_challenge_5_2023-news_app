import 'package:flutter/cupertino.dart';

void normalPush({required BuildContext context, required Widget widget}) {
  Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => widget,
      ));
}