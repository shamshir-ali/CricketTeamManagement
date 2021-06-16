import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppUtil{
  Future<bool> showOkAlert(String message, BuildContext context, {String defaultTitle = 'Error', String defaultOption = 'Ok'}) async{
    await showDialog(context: context,
        builder: (context) => AlertDialog(
          title: Text(defaultTitle),
          content: Text(message),
          actions: [
            new RaisedButton(onPressed: () => Navigator.pop(context, true), child: Text(defaultOption))
          ],
        )
    ).then((exit) {
      return exit;
    });
    return false;
  }

  Future<bool> okCancelAlert(BuildContext context, {String title = 'Alert', String message = 'One or more players have empty rating!', String ok = 'OK', String cancel = 'Cancel'}) async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text(title),
        content: new Text(message),
        actions: <Widget>[
          new RaisedButton(
            onPressed: () => Navigator.pop(context, false),
            child: new Text(cancel),
          ),
          new RaisedButton(
            onPressed: () => Navigator.pop(context, true), //Navigator.of(context).pop(true),
            child: new Text(ok),
          ),
        ],
      ),
    )) ?? false;
  }
}