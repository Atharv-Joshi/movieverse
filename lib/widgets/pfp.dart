import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:movieverse/screens/profile.dart';
import 'package:movieverse/utils/colors.dart';

class Pfp extends StatefulWidget {
  const Pfp({Key? key}) : super(key: key);

  @override
  _PfpState createState() => _PfpState();
}

class _PfpState extends State<Pfp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getFirstLastName(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: Initicon(
                backgroundColor: AppColors().purple1,
                size: 90,
                text: snapshot.data.join(' ') ?? 'Jon Doe',
              ),
            );
          } else {
            return Container();
          }
        }
        );
  }
}
