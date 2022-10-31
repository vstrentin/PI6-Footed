import 'package:flutter/material.dart';


class BuilderAppBar extends StatefulWidget {
  const BuilderAppBar({super.key});

  @override
  State<BuilderAppBar> createState() => _BuilderAppBarState();
}

class _BuilderAppBarState extends State<BuilderAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(108, 69, 7, 202),
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.keyboard_backspace_rounded),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {}, 
          icon: Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {}, 
          icon: Icon(Icons.supervisor_account),
        )
      ],
    );
  }
}