import 'package:flutter/material.dart';

class Subtitle extends StatelessWidget {
  final String text;
  const Subtitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontSize: 18
        ),),
    );
  }
}
