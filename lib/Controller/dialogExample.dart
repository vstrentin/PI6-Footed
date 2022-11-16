import 'package:flutter/material.dart';

class DialogExample {

  Future<void> showDialogErro(BuildContext context, String txtTitle, String txtDescription) async {
    return showDialog<void>(
      context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(txtTitle),
          content: Text(txtDescription),
          icon: Icon( Icons.error,color: Colors.red,),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
    );
  }

  Future<void> showDialogSuccess(BuildContext context, String txtTitle, String txtDescription) async {
    return showDialog<void>(
      context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(txtTitle),
          content: Text(txtDescription),
          icon: Icon( Icons.check_circle,color: Colors.green,),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
    );
  }

}