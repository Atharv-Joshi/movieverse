import 'package:flutter/material.dart';
import 'package:movieverse/screens/dashboard.dart';
import 'package:movieverse/utils/colors.dart';


class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/bg.png',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 200,
                    height: 50,
                    child: TextField(
                      onSubmitted: (value) async {
                        if (value == 'enterapp') {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => Dashboard(),
                            ),
                            (route) => false,
                          );
                        } else {}
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          fillColor: AppColors().purple6,
                          filled: true,
                          hintText: 'type enterapp',
                          hintStyle: TextStyle(
                            color: Colors.white70,
                          )),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
