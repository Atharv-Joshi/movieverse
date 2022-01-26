import 'package:flutter/material.dart';
import 'package:movieverse/utils/colors.dart';
import 'package:movieverse/widgets/base_container.dart';
import 'package:movieverse/widgets/pfp.dart';
import 'package:movieverse/widgets/subtitle.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<String>> getFirstLastName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String firstName = prefs.getString('firstName') ?? 'John';
  String lastName = prefs.getString('lastName') ?? 'Doe';
  return [firstName, lastName];
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isFirstNameReadOnly = true;
  bool isLastNameReadOnly = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseContainer(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                  future: getFirstLastName(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      TextEditingController firstNameController =
                          TextEditingController();
                      TextEditingController lastNameController =
                          TextEditingController();
                      firstNameController.text = snapshot.data[0];
                      lastNameController.text = snapshot.data[1];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Subtitle(text: 'First Name'),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                                margin: EdgeInsets.only(top: 10),
                                width: 200,
                                height: 50,
                                child: TextField(
                                  controller: firstNameController,
                                  // readOnly: isFirstNameReadOnly,
                                  onSubmitted: (value) async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setString('firstName', value);
                                  },
                                  // onTap: () {
                                  //   setState(() {
                                  //     isFirstNameReadOnly =
                                  //         !isFirstNameReadOnly;
                                  //   });
                                  // },
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      fillColor: AppColors().purple6,
                                      filled: true,
                                      hintStyle: TextStyle(
                                        color: Colors.white70,
                                      )),
                                )),
                          ),
                          Subtitle(text: 'Last Name'),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                                margin: EdgeInsets.only(top: 10),
                                width: 200,
                                height: 50,
                                child: TextField(
                                  controller: lastNameController,
                                  // readOnly: isLastNameReadOnly,
                                  onSubmitted: (value) async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setString('lastName', value);
                                  },
                                  // onTap: () {
                                  //   setState(() {
                                  //     isLastNameReadOnly = !isLastNameReadOnly;
                                  //   });
                                  // },
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      fillColor: AppColors().purple6,
                                      filled: true,
                                      hintStyle: TextStyle(
                                        color: Colors.white70,
                                      )),
                                )),
                          ),
                        ],
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    }
                  }),
              Pfp(),
            ],
          ),
        ),
      ),
    );
  }
}
